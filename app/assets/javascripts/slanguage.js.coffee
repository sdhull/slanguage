#= require_self
#= require ./models
#= require ./store
#= require ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router

window.App = App = Ember.Application.create {}

Ember.TextSupport.reopen
  attributeBindings: ["placeHolder"]
