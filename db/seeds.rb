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


puts "Creating stuff"
nathan = User.create!(first_name: "A", last_name: "B", email: "nathan@clean.com", password: "12345678")
reka = User.create!(first_name: "A", last_name: "B", email: "reka@clean.com", password: "12345678")
louis = User.create!(first_name: "A", last_name: "B", email: "louis@clean.com", password: "12345678")

puts "User created"

voiture = Transportation.create!(category: "Voiture", emission: 1)
avion = Transportation.create!(category: "Avion", emission: 2)
train = Transportation.create!(category: "Train", emission: 3)

puts "Transportations created"

burundi = Project.create!(name: "Burundi", carbon: 1, description: "blabla")
amazone = Project.create!(name: "Amazonia", carbon: 2, description: "blabla")
cambodge = Project.create!(name: "Cambodgia", carbon: 3, description: "blabla")

puts "Projects created"

trip_reka = Trip.new(user: reka, transportation: avion, km: 2000, number: 1)
compensation_reka = Compensation.create!(project: amazone, amount: 2000)
trip_reka.compensation = compensation_reka
trip_reka.save!
trip_reka2 = Trip.new(user: reka, transportation: train, km: 200, number: 2)
compensation_reka2 = Compensation.create!(project: burundi, amount: 1200)
trip_reka2.compensation = compensation_reka2
#amount: 2000
trip_reka2.save!

puts "stuff created"

# trip_nathan = Trip.create!(user: nathan, transportation: voiture, km: 20, number: 10)
# compensation_nathan = Compensation.create!(project: burundi, amount: )

# trip_reka =
# trip_louis =
# trip1.compensation

