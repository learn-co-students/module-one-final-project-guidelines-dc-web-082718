bill_murray = Actor.create(name: "Bill Murray")
scarlett = Actor.create(name: "Scarlett Johansson")
bruce_willis = Actor.create(name: "Bruce Willis")

lost_in_translation = Movie.create(name: "Lost in Translation")
moonrise_kingdom = Movie.create(name: "Moonrise Kingdom")

Character.create(name: "Bob Harris", movie_id: lost_in_translation.id, actor_id: bill_murray.id )
Character.create(name: "Charlotte", movie_id: lost_in_translation.id, actor_id: scarlett.id)
