# destroy-heroku-app

Simple GitHub Action to destroy a given Heroku Application.

If the app doesn't exist, the command will do nothing.


Example usage:
```yaml
---
name: delete review app on pull request close

on:
  pull_request:
    types: [closed]

jobs:
  delete_review_apps:
    runs-on: ubuntu-latest
    steps:
      - name: destroying review app
        uses: Thermondo/destroy-heroku-app@
        with:
          heroku_api_key: ${{ secrets.HEROKU_API_KEY }}
          app_name: appname-pr-${{ github.event.pull_request.number }}

```
## API-key permissions
The provided `HEROKU_API_KEY` needs *manage* permissions on the app to destroy.
For review apps in pipelines this means that the user needs these **manage permissions on the pipeline**, because newly created review apps inherit the permissions from the pipeline.
