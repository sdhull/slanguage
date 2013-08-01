App.Router.map ->
  @resource 'about'
  @resource 'slangs', ->
    @resource 'slang', path: ':slang_id'
    @resource 'words', ->
      @resource 'word', path: ':word_id'

