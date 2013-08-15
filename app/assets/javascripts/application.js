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
//= require_self
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

// TODO: fill out the stuff below for slanguage
window.fbAsyncInit = function() {
  // init the FB JS SDK
  FB.init({
    appId      : 'YOUR_APP_ID',                        // App ID from the app dashboard
    channelUrl : '//WWW.YOUR_DOMAIN.COM/channel.html', // Channel file for x-domain comms
    status     : true,                                 // Check Facebook Login status
    xfbml      : true                                  // Look for social plugins on the page
  });

  // Additional initialization code such as adding Event Listeners goes here
};

// Load the SDK asynchronously
(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
