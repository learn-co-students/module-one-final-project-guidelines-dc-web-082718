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

#employed bartenders
Bartender.create(name: "Dru", bar_id: 1)
Bartender.create(name: "Sam", bar_id: 1)
Bartender.create(name: "Hulk Hogan", bar_id: 1)
Bartender.create(name: "Paul", bar_id: 2)
Bartender.create(name: "Adam", bar_id: 3)

#The following barternders are undemployed
Bartender.create(name: "Jelly")
Bartender.create(name: "Izzy")
Bartender.create(name: "Chelly")
Bartender.create(name: "Trevor")
Bartender.create(name: "Srikant")


BartenderDrink.create(bartender_id: 1, drink_id: 1) #dru makes martini/employed
BartenderDrink.create(bartender_id: 1, drink_id: 2) #dru make Margarita
BartenderDrink.create(bartender_id: 2, drink_id: 3) #sam makes sex on the beach/employed
BartenderDrink.create(bartender_id: 2, drink_id: 1) #sam makes martini
BartenderDrink.create(bartender_id: 3, drink_id: 5) #hulk makes manhattan/employed
BartenderDrink.create(bartender_id: 3, drink_id: 1) #hulk makes martini
BartenderDrink.create(bartender_id: 4, drink_id: 7) #paul makes cosmo /employed
BartenderDrink.create(bartender_id: 4, drink_id: 8) #paul makes negroni
BartenderDrink.create(bartender_id: 10, drink_id: 1) #sriknat makes martini/unemployed
BartenderDrink.create(bartender_id: 6, drink_id: 5) #jelly makes manhatten/umemployed
BartenderDrink.create(bartender_id: 7, drink_id: 1) #izzy makes martini/unemployed
BartenderDrink.create(bartender_id: 8, drink_id: 9) #chelly makes cosmo/unemployed
BartenderDrink.create(bartender_id: 9, drink_id: 8) #trevor makes negroni/unemployed
