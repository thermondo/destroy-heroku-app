
if
      run: "
        heroku info --app '${{ inputs.app_name }}' &&
        echo ::set-output name=exists::true ||
        echo ::set-output name=exists::false
      "
    - name: destroying application
      if: steps.app-exists.outputs.exists == 'true'
      shell: bash
      run: "
        heroku apps:destroy
        --app '${{ inputs.app_name }}'
        --confirm '${{ inputs.app_name }}'
      "
