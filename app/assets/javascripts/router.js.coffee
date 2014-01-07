# For more information see: http://emberjs.com/guides/routing/

App.Router.reopen
  location: 'history'

Ember.Route.reopen
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
    return App.Slang.FIXTURES
    #return @store.find('slang')
