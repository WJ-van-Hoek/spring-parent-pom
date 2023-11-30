#!/bin/bash

cat <<EOF > .circleci/generated_config.yml
version: 2.1

jobs:
  $(cat .circleci/job-package-maven.yml)

  $(cat .circleci/job-deploy-maven.yml)

  $(cat .circleci/job-increment-version.yml)

EOF

cat <<EOF >> .circleci/generated_config.yml
workflows:
  version: 2
  $(cat .circleci/workflow-package.yml)

  $(cat .circleci/workflow-release.yml)

EOF

