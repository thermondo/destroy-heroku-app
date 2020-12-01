#!/bin/bash

if heroku info --app "${HEROKU_APP_NAME}" > /dev/null; then
  echo ::set-output name=exists::true
  heroku apps:destroy --app "${HEROKU_APP_NAME}" --confirm "${HEROKU_APP_NAME}"
else
  echo ::set-output name=exists::false
fi
