# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

User.destroy_all
Monster.destroy_all
Contract.destroy_all

puts "Creating DataBase"
puts "Creating Ilyes_user....bip bip....."

# ilyes
file = URI.open("https://loremflickr.com/150/150/abstract")
ilyes_user = User.new(
  email: "ilyes@battle.com",
  password: "123456",
  name: "Ilyes",
  coin: Faker::Commerce.price(range: 0..10),
)
ilyes_user.avatar.attach(io: file, filename: 'ilyes.png', content_type: 'image/png')
ilyes_user.save!

ilyes_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: ilyes_user.id
)
ilyes_monster1.image.attach(io: file, filename: 'ilyes.png', content_type: 'image/png')
ilyes_monster1.save

ilyes_monster2 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: ilyes_user.id
)
ilyes_monster2.image.attach(io: file, filename: 'ilyes.png', content_type: 'image/png')
ilyes_monster2.save

ilyes_monster3 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: ilyes_user.id
)

ilyes_monster3.image.attach(io: file, filename: 'ilyes.png', content_type: 'image/png')
ilyes_monster3.save

puts "Profile Ilyes_user.......has been created."
puts "Creating Jonathan_user....bip bip....."

# Jonathan
john_user = User.new(
  email: "jonathan@battle.com",
  password: "123456",
  name: "Jonathan",
  coin: Faker::Commerce.price(range: 0..10),
)
john_user.avatar.attach(io: file, filename: 'jonathan.png', content_type: 'image/png')
john_user.save!

puts "Profile Jonathan_user.......has been created."
puts "Creating Thibault_user....bip bip....."

# Thibault
thibault_user = User.new(
  email: "thibault@battle.com",
  password: "123456",
  name: "Thibault",
  coin: Faker::Commerce.price(range: 0..10),
)
thibault_user.avatar.attach(io: file, filename: 'thibault.png', content_type: 'image/png')
thibault_user.save!

thibault_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: thibault_user.id
)
thibault_monster1.image.attach(io: file, filename: 'ilyes.png', content_type: 'image/png')
thibault_monster1.save

puts "Profile Thibault_user.......has been created."
puts "Creating Tarek_user....bip bip....."

# Tarek
tarek_user = User.new(
  email: "tarek@battle.com",
  password: "123456",
  name: "Tarek",
  coin: Faker::Commerce.price(range: 0..10),
)
tarek_user.avatar.attach(io: file, filename: 'tarek.png', content_type: 'image/png')
tarek_user.save!

tarek_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: Faker::Fantasy::Tolkien.race,
  description: Faker::Fantasy::Tolkien.poem,
  price: Faker::Commerce.price(range: 0..10.0, as_string: true),
  user_id: tarek_user.id
)
tarek_monster1.image.attach(io: file, filename: 'ilyes.png', content_type: 'image/png')
tarek_monster1.save

puts "Profile Tarek_user.......has been created."

Contract.create!(
  battles: Faker::Commerce.price(range: 0..5).to_i,
  actif: true,
  monster_id: thibault_monster1.id,
  user_id: ilyes_user.id
)

Contract.create!(
  battles: Faker::Commerce.price(range: 0..5).to_i,
  actif: true,
  monster_id: tarek_monster1.id,
  user_id: ilyes_user.id
)

puts "All operations done....."
puts "DataBase created....You're all set to go bro !"
