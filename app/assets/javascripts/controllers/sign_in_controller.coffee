App.SignInController = Ember.ObjectController.extend
  actions:
    fbLogin: ->
      FB.login((response) ->
        if response.authResponse
          authResponse = FB.getAuthResponse()
          console.log "Your access token is #{App.fbToken}"
          # TODO: Send fbToken to our server, get our token back
          $.ajax
            type: "POST"
            url: "/users/sign_in"
            data:  {facebook_token: authResponse.accessToken, email: authResponse.email}
            beforeSend: App.showProgress
            complete: App.hideProgress
            error: (jqXHR, textStatus, errorThrown) =>
              alert(jqXHR.responseText)
              # render errors
            success: (data, textStatus, jqXHR) =>
              alert(data)

          console.log 'Welcome!  Fetching your information.... '
          FB.api '/me', (response) ->
            console.log 'Good to see you, ' + response.name + '.'
        else
          console.log 'User cancelled login or did not fully authorize.'
      ,{scope: 'email'})

    login: ->
      $.ajax
        type: "POST",
        url: "/users/sign_in",
        data:  {email: @get('email'), password: @get('password')}
        dataType: "json"
        beforeSend: App.showProgress
        complete: App.hideProgress
        error: (jqXHR, textStatus, errorThrown) =>
          @set('password', '')
          alert(jqXHR.responseText)
          # render errors
        success: (data, textStatus, jqXHR) =>
          alert(data)
          @set('password', '')
          @set('email', '')
          # redirect to your slangs?

  email: ''
  password: ''
