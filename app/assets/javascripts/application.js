// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require welcome
//= require models
//= require routes
//= require controllers
// view templates will simply be rendered into application layout
// TODO: consider async loading of views?

window.App = App = Ember.Application.create({});

Ember.TextSupport.reopen({
  attributeBindings: ["placeHolder"]
})

var fbAppId = $("meta[name='fb-app-id']").attr("content");
var channelUrl = $("meta[name='channel-url']").attr("content");
window.fbAsyncInit = function() {
  // init the FB JS SDK
  FB.init({
    // App ID from the app dashboard
    appId: fbAppId,
    // Channel file for x-domain comms
    channelUrl: channelUrl,
    // Check Facebook Login status
    status: true,
    // Look for social plugins on the page
    xfbml: true
  });

  // Additional initialization code such as adding Event Listeners goes here

  // Here we subscribe to the auth.authResponseChange JavaScript event. This event is fired
  // for any authentication related change, such as login, logout or session refresh. This means that
  // whenever someone who was previously logged out tries to log in again, the correct case below 
  // will be handled. 
  FB.Event.subscribe('auth.authResponseChange', function(response) {
    // Here we specify what we do with the response anytime this event occurs. 
    if (response.status === 'connected') {
      // The response object is returned with a status field that lets the app know the current
      // login status of the person. In this case, we're handling the situation where they 
      // have logged in to the app.
      testAPI();
    }
  });
};

// Load the SDK asynchronously
(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));