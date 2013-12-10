#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

window.App = App = Ember.Application.create {}

Ember.TextSupport.reopen
  attributeBindings: ["placeHolder"]

fbAppId = $("meta[name='fb-app-id']").attr("content")
channelUrl = $("meta[name='channel-url']").attr("content")
window.fbAsyncInit = ->
  # init the FB JS SDK
  FB.init
    # App ID from the app dashboard
    appId: fbAppId,
    # Channel file for x-domain comms
    channelUrl: channelUrl,
    # Check Facebook Login status
    status: true,
    # Look for social plugins on the page
    xfbml: true

  # Additional initialization code such as adding Event Listeners goes here

  # Here we subscribe to the auth.authResponseChange JavaScript event. This event is fired
  # for any authentication related change, such as login, logout or session refresh. This means that
  # whenever someone who was previously logged out tries to log in again, the correct case below 
  # will be handled. 
  FB.Event.subscribe('auth.authResponseChange', ->(response)
  # Here we specify what we do with the response anytime this event occurs.
    if (response.status === 'connected')
      # The response object is returned with a status field that lets the app know the current
      # login status of the person. In this case, we're handling the situation where they 
      # have logged in to the app.
      testAPI()

# Load the SDK asynchronously
(->(d, s, id){
  js, fjs = d.getElementsByTagName(s)[0]
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id
  js.src = "//connect.facebook.net/en_US/all.js"
  fjs.parentNode.insertBefore(js, fjs)
}(document, 'script', 'facebook-jssdk'))
