#!/bin/bash

CURRENT_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
NEXT_VERSION=$(echo "${CURRENT_VERSION}" | awk -F'.' '{print $1"."$2"."$3 + 1}')
mvn versions:set -DnewVersion="${NEXT_VERSION}"

git config --global user.email "${USER_EMAIL}"
git config --global user.name "${USER_NAME}"
git commit -am "Bump version to ${NEXT_VERSION} [ci skip]"
git push origin master