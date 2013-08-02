App.Router.map ->
  @route "about"
  @route "signin"
  @route "signout"
  @resource 'slangs', ->
    @resource 'slang', path: ':slang_id'
    @resource 'words', ->
      @resource 'word', path: ':word_id'

