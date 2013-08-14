App.Router.reopen
  location: 'history'

App.Router.map ->
  @route "about"
  @route "signin"
  @route "signout"
  @resource 'slangs', ->
    @resource 'slang', path: ':slang_id'
    @resource 'words', ->
      @resource 'word', path: ':word_id'

App.IndexRoute = Ember.Route.extend
  model: ->
    return App.Word.find()

App.IndexView = Ember.View.extend
  didInsertElement: ->
    $(".carousel").carousel('pause')
