# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
  User.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.free_email,
    dob: Faker::Date.between(30.years.ago, Date.today),
    password: "12345678"
  )
end

70.times do
  Listing.create(
    user_id: rand(1..20),
    title: Faker::App.name,
    description: Faker::Address.street_name,
    max_guest: Faker::Number.between(1,10),
    price: Faker::Number.between(100,500)
  )
end
