#!/usr/bin/env bash

# This is called if the REPO_TYPE is "gitlab-saas".
ALLOWED_TYPES="aab/apk/ipa";

# First we need to make sure this is an MR update.
if [ "$CM_PULL_REQUEST" == "true" ]; then
    # Now let's make an API call to Gitlab and get the merge request information.
    # Then we update the description to include the CM_ARTIFACT_LINKS data.
    # And finally we make an API call to gitlab to update the merge request.
    gh api -H "Accept: application/vnd.github.v3+json" "/repos/$GITHUB_PROJECT_OWNER/$GITHUB_PROJECT_REPO/pulls/$CM_PULL_REQUEST_NUMBER" > mr.json
    # Now we need to get the description from the JSON file
    DESCRIPTION=$(cat mr.json | jq -r '.body')
    # We need to parse the CM articat links into objects. For each one we need to create a formatted string.
    # Each one should have a header for the name and then the URL as a formatted link.
    # We will use the jq command to parse the JSON file.
    ARTIFACT_LINKS=$(echo $CM_ARTIFACT_LINKS | jq -r '.[] | "\(.name);\(.url);\(.type);\(.versionName);\n"')
    # Now we need to loop over each artifact link and use the name as a header and the URL as the link.
    for ARTIFACT_LINK in $ARTIFACT_LINKS; do
        # Now we need to split the artifact link into the name and URL.
        NAME=$(echo $ARTIFACT_LINK | cut -d';' -f1 | sed -e 's/[\/&]/\\&/g')
        URL=$(echo $ARTIFACT_LINK | cut -d';' -f2 | sed -e 's/[\/&]/\\&/g')
        TYPE=$(echo $ARTIFACT_LINK | cut -d';' -f3 | sed -e 's/[\/&]/\\&/g')
        VERSION=$(echo $ARTIFACT_LINK | cut -d';' -f4 | sed -e 's/[\/&]/\\&/g')

        if [[ $ALLOWED_TYPES =~ $TYPE ]]; then
            # Now we need to create a formatted string for the artifact link.
            ARTIFACT_LINK_STRING=$(sed -e "s/NAME/$NAME/g" -e "s/URL/$URL/g" -e "s/VERSION/$VERSION/g" -e "s/BUILD_TYPE/$BUILD_TYPE/g" <<< cat ./scripts/mr-update.txt)
            # Now we need to add the artifact link to the description.
            DESCRIPTION="$DESCRIPTION<br />$ARTIFACT_LINK_STRING"
        fi
    done

    # Now we need to update the MR in the API.
    gh api --method PATCH -H "Accept: application/vnd.github.v3+json" "/repos/$GITHUB_PROJECT_OWNER/$GITHUB_PROJECT_REPO/pulls/$CM_PULL_REQUEST_NUMBER" -f body="$DESCRIPTION"
fi

echo "Finished updating the MR $GITHUB_PROJECT_REPO/$CM_PULL_REQUEST_NUMBER"