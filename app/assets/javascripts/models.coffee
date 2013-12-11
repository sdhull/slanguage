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
  slangs: DS.hasMany('App.Slang')
  wordsAuthored: DS.hasMany('App.Word', {inverse: 'author'})
  fbId: DS.attr('string')
  fullName: (->
    "#{this.get('firstName')} #{this.get('lastName')}"
  ).property('firstName', 'lastName')

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

App.User.FIXTURES = [{
  id: 1
  firstName: "Steve"
  lastName: "Hull"
  fbId: 123
}, {
  id: 2
  firstName: "your"
  lastName: "mom"
  fbId: 345
}]

App.Slang.FIXTURES = [{
  id: 1
  name: "HIMYisms"
  createdAt: new Date('12-27-2012')
  updatedAt: new Date('12-27-2012')
  #author: App.User.find(1)
  description: "Words and catchphrases from the popular show How I Met Your Mother"
}, {
  id: 2
  name: "Wybrids"
  createdAt: new Date('12-27-2011')
  updatedAt: new Date('12-27-2011')
  #author: App.User.find(2)
  description: "Words combined with other words resulting in something combotacular!"
}]

App.Word.FIXTURES = [{
  id: 1
  #slang: App.Slang.find(1)
  #author: App.User.find(1)
  #lastModifiedBy: App.User.find(1)
  name: "possimpible"
  definition: "Where the possible meets the impossible to become... possimpible!"
  pronounciation: "Poss - imp - îble"
  etymology: "Combination of possible & impossible"
  origin: "Barney. S04E14"
}, {
  id: 2
  #slang: App.Slang.find(2)
  #author: App.User.find(2)
  #lastModifiedBy: App.User.find(2)
  name: "synergestic"
  definition: "Majestic syngery"
  pronounciation: "Syn - er - ges - tic"
  etymology: "Combination of synergy & majestic"
  origin: "Your mom"
}]

