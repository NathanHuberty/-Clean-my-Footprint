# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Compensation.destroy_all
Trip.destroy_all
Project.destroy_all
Transportation.destroy_all
User.destroy_all


puts "Creating stuff"
nathan = User.create!(email: "nathan@clean.com", password: "12345678")
reka = User.create!(email: "reka@clean.com", password: "12345678")
louis = User.create!(email: "louis@clean.com", password: "12345678")

puts "User created"

voiture = Transportation.create!(category: "voiture", emission: 1)
avion = Transportation.create!(category: "avion", emission: 2)
train = Transportation.create!(category: "train", emission: 3)

puts "Transportations created"

burundi = Project.create!(name: "Burundi", carbon: 1)
amazone = Project.create!(name: "Amazonia", carbon: 2)
cambodge = Project.create!(name: "Cambodgia", carbon: 3)

puts "Projects created"

trip_reka = Trip.new(user: reka, transportation: avion, km: 2000, number: 1)
compensation_reka = Compensation.create!(project: amazone, amount: 2000)
trip_reka.compensation = compensation_reka
#amount: 2000
trip_reka.save!

puts "stuff created"

# trip_nathan = Trip.create!(user: nathan, transportation: voiture, km: 20, number: 10)
# compensation_nathan = Compensation.create!(project: burundi, amount: )

# trip_reka =
# trip_louis =
# trip1.compensation

