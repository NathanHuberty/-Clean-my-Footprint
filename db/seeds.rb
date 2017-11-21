# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trip.destroy_all
Compensation.destroy_all
Project.destroy_all
Transportation.destroy_all
User.destroy_all



puts "Creating seed"

user_attributes = [
  { first_name: "A", last_name: "B", email: "nathan@clean.com", password: "12345678" },
  { first_name: "A", last_name: "B", email: "reka@clean.com", password: "12345678" },
  { first_name: "A", last_name: "B", email: "louis@clean.com", password: "12345678" }
]

user_attributes.each do |attr|
  user = User.new(attr)
  user.save!
end

# creating users with radom attributes
8.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "12345678"
  )
  user.save!
end

puts "Users created"


# creating means of transportation
transportation_attributes = [
  { category: "Voiture", emission: 0.1181 },
  { category: "Avion", emission: 0.115 },
  { category: "Train", emission: 0.0602 }
]

transportation_attributes.each do |attr|
  transport = Transportation.new(attr)
  transport.save!
end

puts "Transportations created"


# creating projects
project_attributes= [
  { name: Faker::Address.country, carbon: 1, description: Faker::Lorem.paragraph },
  { name: Faker::Address.country, carbon: 2, description: Faker::Lorem.paragraph },
  { name: Faker::Address.country, carbon: 3, description: Faker::Lorem.paragraph },
  { name: Faker::Address.country, carbon: 3, description: Faker::Lorem.paragraph },
  { name: Faker::Address.country, carbon: 4, description: Faker::Lorem.paragraph }
]

project_attributes.each do |attr|
  project = Project.new(attr)
  project.save!
end

puts "Projects created"


# creating trips, last 5 trips are not compensated!
User.all.each do |user|
  rand(1..5).times do
    trip = Trip.new(user: user, transportation: Transportation.all.sample, km: rand(20..1500), number: rand(1..10) )
    trip.save!
  end
end

puts "Trips created"

# creating compensations
Trip.all[0..-5].each do |trip|
  comp = Compensation.create!(project: Project.all.sample, amount: rand(10..450))
  trip.update!(compensation: comp)
end

puts "Compensations created"
puts "End of seed"


