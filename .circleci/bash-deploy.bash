#!/bin/bash

git checkout master
git fetch
git pull origin
mvn deploy --settings ./.circleci/settings.xml