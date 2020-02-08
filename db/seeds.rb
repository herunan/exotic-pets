# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

url = 'https://source.unsplash.com/featured/?'

puts 'Clearing users, pets and bookings'
User.destroy_all
Pet.destroy_all
Booking.destroy_all

Faker::Config.locale = 'en-GB'

puts 'Creating users and pets'
5.times do
  gender = ['man', 'woman'].sample
  user = User.new(
    first_name: gender == 'male' ? Faker::Name.male_first_name : Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    phone_number: Faker::PhoneNumber.phone_number,
    bio: Faker::Lorem.paragraph_by_chars(number: 256),
    password: '123456',
  )
  user.photo.attach(io: open(url + gender), filename: gender)
  rand(1..3).times do
    species = Faker::Creature::Animal.name
    pet = Pet.new(
      name: Faker::Creature::Dog.name,
      species: species,
      description: Faker::Lorem.paragraph_by_chars(number: 256),
      address: Faker::Address.full_address,
      price: rand(200..10000)
    )
    rand(1..5).times do
      pet.photos.attach(io: open(url + pet.species), filename: species)
    end
    pet.user = user
    pet.save!
  end
  user.save!
end

puts "Complete!"
