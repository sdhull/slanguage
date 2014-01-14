#= require_self
#= require ./store
#= require ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router

window.App = App = Ember.Application.create {}

Ember.TextSupport.reopen
  attributeBindings: ["placeHolder"]

App.showProgress = ->
  view = $(".header")[0]
  if @spnr?
    @spnr.spin(view)
  else
    @spnr = new Spinner(left: 263, top: 37).spin(view)

App.hideProgress = ->
  @spnr.stop() if @spnr?
