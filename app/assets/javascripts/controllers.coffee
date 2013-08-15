App.SignInController = Ember.ObjectController.extend({
  fbLogin: ->
    console.log "woot: fblogin called"

    FB.login (response) ->
     if response.authResponse
       App.fbToken = FB.getAuthResponse()['accessToken']
       console.log "Your access token is #{App.fbToken}"
       # TODO: Send fbToken to our server, get our token back

       console.log 'Welcome!  Fetching your information.... '
       FB.api '/me', (response) ->
         console.log 'Good to see you, ' + response.name + '.'
     else
       console.log 'User cancelled login or did not fully authorize.'

  login: ->
    console.log "woot: login called"
    this.get('store').commit() # save the user
})
