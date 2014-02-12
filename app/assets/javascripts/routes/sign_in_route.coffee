App.IndexRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'session'
