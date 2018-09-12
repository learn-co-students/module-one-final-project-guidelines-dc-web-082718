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

#full staff
Bar.create(name: "Mad Hatter")

#has employees
Bar.create(name: "Heist")
Bar.create(name: "Dirty Bar")

#has no employees
Bar.create(name: "Public Bar")


Bartender.create(name: "Dru", bar_id: 1)
Bartender.create(name: "Sam", bar_id: 1)
Bartender.create(name: "Hulk Hogan", bar_id: 1)
Bartender.create(name: "Paul", bar_id: 2)
Bartender.create(name: "Adam", bar_id: 3)
Bartender.create(name: "Jelly")
Bartender.create(name: "Izzy")
Bartender.create(name: "Chelly")
Bartender.create(name: "Trevor")
Bartender.create(name: "Srikant")

BartenderDrink.create(bartender_id: 1, drink_id: 1)
BartenderDrink.create(bartender_id: 1, drink_id: 2)
BartenderDrink.create(bartender_id: 2, drink_id: 3)
BartenderDrink.create(bartender_id: 2, drink_id: 1)
BartenderDrink.create(bartender_id: 3, drink_id: 5)
BartenderDrink.create(bartender_id: 3, drink_id: 1)
BartenderDrink.create(bartender_id: 4, drink_id: 7)
BartenderDrink.create(bartender_id: 4, drink_id: 8)
BartenderDrink.create(bartender_id: 10, drink_id: 1)
BartenderDrink.create(bartender_id: 6, drink_id: 5)
BartenderDrink.create(bartender_id: 7, drink_id: 1)
BartenderDrink.create(bartender_id: 8, drink_id: 7)
BartenderDrink.create(bartender_id: 9, drink_id: 8)
