
User.create(
  first_name: "Steve",
  last_name: "Hull",
  email: "steve@example.com",
  fbId: 123
)
User.create(
  first_name: "your",
  last_name: "mom",
  email: "urmoms@example.com",
  fbId: 345
)

Slang.create(
  name: "HIMYisms",
  author: User.find(1),
  description: "Words and catchphrases from the popular show How I Met Your Mother"
)
Slang.create(
  name: "Wybrids",
  author: User.find(2),
  description: "Words combined with other words resulting in something combotacular!"
)

Word.create(
  slang: Slang.find(1),
  author: User.find(1),
  last_modified_by: User.find(1),
  name: "possimpible",
  definition: "Where the possible meets the impossible to become... possimpible!",
  pronounciation: "Poss - imp - îble",
  etymology: "Combination of possible & impossible",
  origin: "Barney. S04E14"
)
Word.create(
  slang: Slang.find(2),
  author: User.find(2),
  last_modified_by: User.find(2),
  name: "synergestic",
  definition: "Majestic syngery",
  pronounciation: "Syn - er - ges - tic",
  etymology: "Combination of synergy & majestic",
  origin: "Your mom"
)

  references:slang
  references:author
  references:last_modified_by
  string:name
  string:definition
  string:pronounciation
  string:variations
  string:etymology
  string:origin
