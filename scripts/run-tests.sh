#!/usr/bin/env bash

# remember some failed commands and report on exit
error=false

show_help() {
    printf "usage: $0 [--help] [--report] [<path to package>]
Tool for running all unit and widget tests with code coverage.
(run from root of repo)
where:
    --help
        print this message
"
    exit 1
}

# run unit and widget tests
runTests () {
  dir=`pwd`
  flutter packages get
  echo "run analyzer in $dir"
  flutter analyze
  echo "run dartfmt in $dir"
  flutter format --fix -n lib
  echo "running tests in $dir"
  # run tests with coverage
  flutter test --coverage || error=true
  lcov --remove coverage/lcov.info 'lib/*/*.gr.dart' 'lib/*/*.freezed.dart' 'lib/*/*.g.dart' -o coverage/lcov.info 
}

if ! [[ -d .git ]]; then printf "\nError: not in root of repo"; show_help; fi

case $1 in
    --help)
        show_help
        ;;
    *)
        runTests
        ;;
esac

#Fail the build if there was an error
if [[ "$error" = true ]] ;
then
    exit -1
fi