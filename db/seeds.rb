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

include CalculationHelper

puts "Creating seed"

user_attributes = [
  { first_name: "Nathan", last_name: "Huberty", email: "nathan@clean.com", password: "12345678" }
  # { first_name: "A", last_name: "B", email: "reka@clean.com", password: "12345678" },
  # { first_name: "A", last_name: "B", email: "louis@clean.com", password: "12345678" }
]

user_attributes.each do |attr|
  user = User.new(attr)
  user.save!
end

# creating users with radom attributes
# 8.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "12345678"
#   )
#   user.save!
# end

puts "Users created"


# creating means of transportation
transportation_attributes = [
  { category: "Voiture", emission: 0.118, icon: "fa-car" },
  { category: "Avion", emission: 0.083, icon: "fa-plane" },
  { category: "Transport en commun", emission: 0.004, icon: "fa-bus" },
  { category: "Moto", emission: 0.115, icon: "fa-motorcycle" },
  { category: "Train", emission: 0.012, icon: "fa-train" }
]
# plane : for long trips it's 0.083, for short trips 0.117

transportation_attributes.each do |attr|
  transport = Transportation.new(attr)
  transport.save!
end

puts "Transportations created"

#mangrove
photo_urls_one_tree = [
"http://4.bp.blogspot.com/-iCmIz42m_bc/U1SXjmUM2mI/AAAAAAAABfU/K0ttS54wsBA/s1600/mangrove.jpg",
"http://vivre-en-thailande.com/files/2016/04/mangrove-p990.1280x814.jpg",
"http://cleanmalaysia.com/wp-content/uploads/2016/02/mangrove.jpg"
]
#chine
photo_urls_billion_trees = [
  "http://redpandanetwork.org/blog/wp-content/uploads/2009/12/RPN-Nepal-AGebauer-03.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/1_tianzishan_wulingyuan_zhangjiajie_2012.jpg/1200px-1_tianzishan_wulingyuan_zhangjiajie_2012.jpg",
  "http://www.brotherearth.com/en/wp-content/uploads/sites/3/2016/07/gujo_1.jpg"
]
#europe
photo_urls_future = [
  "https://d5gyvv73sl4au.cloudfront.net/assets/images/project/peru.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/d/df/Beech_forest_vtacnik.jpg",#
  "https://ssl.c.photoshelter.com/img-get2/I0000QlphWjjn9YU/fit=1000x750/European-lynx-MEUL136.jpg"
]
#africa
photo_urls_international = [
  "http://www.maasaichildreneducation.org/wp-content/uploads/2014/03/4431-1.jpg",#
  "http://internationaltreefoundation.org/wp-content/uploads/2017/05/Pupils-participating-in-tree-planting.jpg",
  "http://topfarmer.co.ke/wp-content/uploads/2017/03/flegt2.jpg"#
]
#indie
photo_urls_carbon = [
 "https://previews.123rf.com/images/501room/501room1206/501room120600031/14208153-Mangrove-forest-Planting-trees-to-the-treatment-plant--Stock-Photo.jpg",#
 "http://www.communitycarbontrees.org/pics/pic59Gal07091514431.jpg",
 "http://www.communitycarbontrees.org/pics/pic41Gal10121409705.jpg"#
]

# creating projects
project_attributes= [
  { name: "On Tree Planted", address: "Malaisie", carbon: 200, description: Faker::Lorem.paragraph(8, false, 2), photo_urls: photo_urls_one_tree, logo: "https://images-platform.99static.com/_l1aD_Pss_hM9aAvKVUoBTW2w5w=/500x500/top/smart/99designs-contests-attachments/30/30161/attachment_30161703" },
  { name: "Plant a Billion Trees", address: "Chine", carbon: 120, description: Faker::Lorem.paragraph(8, false, 2), photo_urls: photo_urls_billion_trees, logo: "http://static.bestfreewebresources.com/wp-content/uploads/2012/01/tree-logo-design-34.jpg" },
  { name: "Trees for the Future", address: "Pologne", carbon: 60, description: Faker::Lorem.paragraph(8, false, 2), photo_urls: photo_urls_future, logo: "http://treeocodeniagara.com/wp-content/uploads/2016/04/Tree-Planting-Sign.png" },
  { name: "International Tree Foundation", address: "Tanzanie", carbon: 150, description: Faker::Lorem.paragraph(8, false, 2), photo_urls: photo_urls_international, logo: "http://gyr.fortlauderdale.gov/Home/ShowImage?id=2024&t=635657287021200000" }
]

project_attributes.each do |attr|
  project = Project.new(attr)
  project.save!
end

puts "Projects created"


# creating trips, first 10 trips are not compensated!
User.all.each do |user|
  10.times do
    trip = Trip.new(user: user, transportation: Transportation.all.sample, km: rand(20..1500), number: rand(1..10) )
    trip.save!
  end
end

puts "Trips created"

# creating compensations
# Les 5 derniers Trips sont compensé
Trip.all[5..-1].each do |trip|
  comp = Compensation.new
  comp.project =  Project.all.sample
  # calculating total co2 emission and translate it into an amount
  total_to_pay = (co2_to_euro(trip.km, trip.transportation.emission, trip.number, comp.project.carbon)).round(2)

  comp.amount = total_to_pay
  comp.save!
  puts "km: #{trip.km} emission: #{trip.transportation.emission} number: #{trip.number} carbon #{comp.project.carbon
  }"
  puts total_to_pay
  trip.update!(compensation: comp)
end

puts "Compensations created"
puts "End of seed"
