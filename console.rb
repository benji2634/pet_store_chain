require_relative('./models/pet')
require_relative('./models/pet_store')

require( 'pry-byebug' )

pet_central = PetStore.new( {'name' => "Pet Central", 'address' => "21 Hayway Road, Glasgow", 'stock_type' => "exotic"} )
pet_central.save

country_store = PetStore.new( {'name' => "Country Store", 'address' => "Westerwoodside Farm, Linlithgow", 'stock_type' => "equine"} )
country_store.save

pet1 = Pet.new( {'name' => 'Jack', 'type' => 'snake', 'pet_store_id' => pet_central.id} )
pet1.save

pet2 = Pet.new( {'name' => 'Jake', 'type' => 'snake', 'pet_store_id' => pet_central.id} )
pet2.save

pet3 = Pet.new( {'name' => 'Tia', 'type' => 'parrot', 'pet_store_id' => pet_central.id} )
pet3.save

pet4 = Pet.new( {'name' => 'Ed', 'type' => 'horse', 'pet_store_id' => country_store.id} )
pet4.save

pet5 = Pet.new( {'name' => 'O''Neill', 'type' => 'pony', 'pet_store_id' => country_store.id} )
pet5.save

binding.pry
nil