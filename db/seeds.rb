# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Clearing user db'
User.destroy_all
puts 'Creating user'
bob = User.create!(first_name: 'bob', last_name: 'steve', phone_number: '02089867000', email:Faker::Internet.email, password: 'password1245')

puts 'Clearing pets db'
Pet.destroy_all
puts 'Creating pets'
lion = pet.create!(name:Faker::Name.unique.name, species:Faker::Creature::Animal.name, description:Faker::Superhero.name, address:Faker::Address.full_address)






# 5.times do |i|
#   pet = Pet.create!(
#     name:Faker::Name.unique.name,
#     species:Faker::Creature::Animal.name,
#     description:Faker::Superhero.name,
#     address:Faker::Address.full_address
#     )
#   end

#   puts "Created 5 pets"