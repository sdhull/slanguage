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
//= require slanguage

$(function(){
  $(document).foundation({
    orbit: {
      animation: 'slide', // Sets the type of animation used for transitioning between slides, can also be 'fade'
      timer_speed: 10000, // Sets the amount of time in milliseconds before transitioning a slide
      pause_on_hover: true, // Pauses on the current slide while hovering
      resume_on_mouseout: false, // If pause on hover is set to true, this setting resumes playback after mousing out of slide
      animation_speed: 500, // Sets the amount of time in milliseconds the transition between slides will last
      slide_selector: 'li',
      stack_on_small: false,
      navigation_arrows: true,
      slide_number: false,
      bullets: true, // Does the slider have bullets visible?
      timer: false, // Does the slider have a timer visible?
      variable_height: false, // Does the slider have variable height content?
      swipe: true
    }
  });
});

window.fbAsyncInit = function() {
  // init the FB JS SDK
  FB.init({
    appId      : '235263266112',                       // App ID from the app dashboard
    channelUrl : '//slang.uage.org/channel.html',      // Channel file for x-domain comms
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
