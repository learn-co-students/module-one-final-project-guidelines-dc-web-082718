Drink.create(name: "Martini")
Drink.create(name: "Margarita")
Drink.create(name: "Sex on the beach")
Drink.create(name: "Old fashioned")
Drink.create(name: "Manhattan")
Drink.create(name: "Yager bombs")
Drink.create(name: "Cosmopolitan")
Drink.create(name: "Negroni")
Drink.create(name: "Sazerac")
Drink.create(name: "Blue motorcyle")
Drink.create(name: "Blue crush")
Drink.create(name: "Purple haze")

Bar.create(name: "Mad Hatter")
Bar.create(name: "Heist")
Bar.create(name: "Dirty Bar")

dru = Bartender.create(name: "Dru")
sam = Bartender.create(name: "Sam", bar_id: 1)
hulk = Bartender.create(name: "Hulk Hogan", bar_id: 3)
