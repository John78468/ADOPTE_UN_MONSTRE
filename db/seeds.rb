# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Creating DataBase"

puts "Creating Ilyes_user....bip bip....."
#ilyes
ilyes_user = User.create!(
  email: "ilyes@battle.com",
  password: "123456",
  name: "Ilyes",
  coin: Faker::Commerce.price(range: 0..10),
  avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1657267400/l8cxfsospw728clpstkm.jpg"
  )

  ilyes_monster1 = Monster.create!(
    name: Faker::Games::Pokemon.name,
    specie: Faker::Fantasy::Tolkien.race,
    description: Faker::Fantasy::Tolkien.poem,
    image: "https://loremflickr.com/150/150/abstract",
    price: Faker::Commerce.price(range: 0..10.0, as_string: true),
    user_id: ilyes_user.id
  )

  ilyes_monster2 = Monster.create!(
    name: Faker::Games::Pokemon.name,
    specie: Faker::Fantasy::Tolkien.race,
    description: Faker::Fantasy::Tolkien.poem,
    image: "https://loremflickr.com/150/150/abstract",
    price: Faker::Commerce.price(range: 0..10.0, as_string: true),
    user_id: ilyes_user.id
  )

  ilyes_monster3 = Monster.create!(
    name: Faker::Games::Pokemon.name,
    specie: Faker::Fantasy::Tolkien.race,
    description: Faker::Fantasy::Tolkien.poem,
    image: "https://loremflickr.com/150/150/abstract",
    price: Faker::Commerce.price(range: 0..10.0, as_string: true),
    user_id: ilyes_user.id
  )


  puts "Profile Ilyes_user.......has been created."
  puts "Creating Jonathan_user....bip bip....."

  #Jonathan
  jonathan_user = User.create!(
    email: "jonathan@battle.com",
    password: "123456",
    name: "Jonathan",
    coin: Faker::Commerce.price(range: 0..10),
    avatar: "https://avatars.githubusercontent.com/u/73955607?v=4"
  )


  puts "Profile Jonathan_user.......has been created."
  puts "Creating Thibault_user....bip bip....."
  #Thibault
  thibault_user = User.create!(
    email: "thibault@battle.com",
  password: "123456",
  name: "Thibault",
  coin: Faker::Commerce.price(range: 0..10),
  avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1657103133/wtxjfxa6ufxukw9utksi.jpg"
)

thibault_monster1 = Monster.create!(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  image: "https://loremflickr.com/150/150/abstract",
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: thibault_user.id
)
puts "Profile Thibault_user.......has been created."
puts "Creating Tarek_user....bip bip....."

#Tarek
tarek_user = User.create!(
  email: "tarek@battle.com",
  password: "123456",
  name: "Tarek",
  coin: Faker::Commerce.price(range: 0..10),
  avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1658123432/wg2ukkepzimi36b3186r.jpg"
)

tarek_monster1 = Monster.create!(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  image: "https://loremflickr.com/150/150/abstract",
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: tarek_user.id
)
puts "Profile Tarek_user.......has been created."

new_contract = Contract.create!(
  battles: Faker::Commerce.price(range: 0..5),
  actif: true,
  monster_id: thibault_monster1.id,
  user_id: ilyes_user.id,
)

new_contract = Contract.create!(
  battles: Faker::Commerce.price(range: 0..5),
  actif: true,
  monster_id: tarek_monster1.id,
  user_id: ilyes_user.id,
)
  # new_user = User.create!(
  #   email: Faker::Internet.email,
  #   password: "123456",
  #   name: Faker::Name.first_name,
  #   coin: Faker::Commerce.price(range: 0..10),
  #   avatar: "https://loremflickr.com/150/150/abstract"
  #   )

  # new_monster = Monster.create!(
  #   name: Faker::Games::Pokemon.name,
  #   specie: Faker::Fantasy::Tolkien.race,
  #   description: Faker::Fantasy::Tolkien.poem,
  #   image: "https://loremflickr.com/150/150/abstract",
  #   price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  #   user_id: new_user.id
  # )

# new_contract = Contract.create!(
#     battles: Faker::Commerce.price(range: 0..5),
#     boolean: true,
#     monster_id: ilyes_monster1.id,
#     user_id: ilyes_user.id,
#   )



puts "All operations done....."
puts "DataBase created....You're all set to go bro !"
