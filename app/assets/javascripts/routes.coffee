App.Router.reopen
  location: 'history'

App.Route.reopen
  isLoggedIn: ->
    App.token?

App.Router.map ->
  @route "about"
  @route "sign_in"
  @route "sign_out"
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
