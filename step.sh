#!/bin/bash

#!/bin/sh
cd $(dirname $0)

if [ ! -d "$ANDROID_HOME" ]; then
    echo "ANDROID_HOME is not available"
    exit
fi

if [ ! -d "$MAVEN_HOME" ]; then
    echo "MAVEN_HOME is not available"
    exit
fi

mvn clean install
ret=$?

if [ $ret -ne 0 ]; then
    exit $ret
fi
rm -rf build

exit

#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
# A very simple example:
#  envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
