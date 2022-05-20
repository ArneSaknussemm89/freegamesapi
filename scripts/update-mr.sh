#!/usr/bin/env bash

case $REPO_TYPE in
    "gitlab-saas")
        bash scripts/gitlab-saas.sh
        ;;
    "gitlab-hosted")
        bash scripts/gitlab-hosted.sh
        ;;
esac
