App.Slang = DS.Model.extend
  name: DS.attr('string')
  author: DS.belongsTo('App.User')
  words: DS.hasMany('App.Word')
  description: DS.attr('string')
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')

App.User = DS.Model.extend
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  email: DS.attr('string')
  slangs: DS.hasMany('App.Slang')
  wordsAuthored: DS.hasMany('App.Word', {inverse: 'author'})
  fbId: DS.attr('string')
  fullName: (->
    "#{this.get('firstName')} #{this.get('lastName')}"
  ).property('firstName', 'lastName')

App.Session = DS.Model.extend
  email: DS.attr('string')
  password: DS.attr('string')
  fbId: DS.attr('string')

App.Word = DS.Model.extend
  slang: DS.belongsTo('App.Slang')
  author: DS.belongsTo('App.User')
  lastModifiedBy: DS.belongsTo('App.User')
  name: DS.attr('string')
  definition: DS.attr('string')
  pronounciation: DS.attr('string')
  variations: DS.attr('string')
  etymology: DS.attr('string') # eg, this is from the greek word "your mom"
  origin: DS.attr('string')    # eg, one day my man Brandon just came up with this shit when some T-Beezy walked by
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')


