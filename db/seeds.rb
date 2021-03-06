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

user_attributes = { first_name: "Nathan",
    last_name: "Huberty",
    email: "nathan@clean.com",
    password: "12345678",
    photo_url: "http://kitt.lewagon.com/placeholder/users/nathanhuberty"
  }
  # { first_name: "A", last_name: "B", email: "reka@clean.com", password: "12345678" },
  # { first_name: "A", last_name: "B", email: "louis@clean.com", password: "12345678" }

user = User.new(user_attributes)
user.save!

# creating two users with random attributes
2.times do
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

# indonesie
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
# UK
photo_urls_international = [
  "https://d5gyvv73sl4au.cloudfront.net/assets/images/project/peru.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/1/1f/England_-_English_Summer_Forest_%287183015516%29.jpg",
  "https://ssl.c.photoshelter.com/img-get2/I0000QlphWjjn9YU/fit=1000x750/European-lynx-MEUL136.jpg"
]
# Tanzanie
photo_urls_future = [
  "https://forestelephants.org/wp-content/uploads/2017/01/HomePageBanner-1024x768.jpg",#
  "http://internationaltreefoundation.org/wp-content/uploads/2017/05/Pupils-participating-in-tree-planting.jpg",
  "https://www.aboutanimals.com/images/african-forest-elephant-group-water-habitat-africa-820x422.jpg"#
]

# creating projects
project_attributes = [
  { name: "One Tree Planted",
    address: "Indonésie",
    carbon: 150,
    description: "Sungai Buluh Besar is a part of Tanjung Puting National Park damaged by forest fires in 2015 when
     30.000 Ha areas was burnt and destroyed by fire. Plant here and you get the satisfaction of helping an area
     that needs the support and has heavy deforestation occuring because of Palm Oil.",
    photo_urls: photo_urls_one_tree,
    logo: "https://images-platform.99static.com/_l1aD_Pss_hM9aAvKVUoBTW2w5w=/500x500/top/smart/99designs-contests-attachments/30/30161/attachment_30161703" },
  { name: "Plant a Billion Trees",
    address: "Chine",
    carbon: 90,
    description: "Increased development and a growing demand for wood products is turning what used to be some
    of the most species-rich forests in the world to small, unsustainable groups of trees. The forests of
    China’s Yunnan and Sichuan provinces are home to the endangered Yunnan golden monkey and the iconic panda,
    and yet these species could disappear with the richness of their forests.
    Your donation can turn the tide of deforestation and plant the roots for tomorrow.
    You’ll do more than put a seed in the ground - you’ll make sure these forests can survive for future
    generations.",
    photo_urls: photo_urls_billion_trees,
    logo: "http://static.bestfreewebresources.com/wp-content/uploads/2012/01/tree-logo-design-34.jpg" },

  { name: "Trees for the Future",
    address: "Tanzanie",
    carbon: 40,
    description: "Trees for the Future is a nonprofit organization founded in 1989 that helps communities
    around the world plant trees. Trees for the Future to date has planted over 65 million trees worldwide
    in 30 countries and has served over 11,000 villages around the world. Trees for the Future provides
    free distance and agroforestry training and education; works in conjunction with over 53 specialists who
    are experts in agroforestry, community development, sustainable agriculture, land use, livestock management,
    women in development and youth education; provides in-country seed distribution, and works on natural
    resource management",
    photo_urls: photo_urls_future,
    logo: "http://treeocodeniagara.com/wp-content/uploads/2016/04/Tree-Planting-Sign.png" },

  { name: "International Tree Foundation",
    address: "Angleterre",
    carbon: 110,
    description: "The International Tree Foundation plants trees, protects and regenerates forests,
    combats desertification and promotes sustainable forestry. We conserve forests, trees, associated
    biodiversity and indigenous forestry knowledge internationally and in the UK and alleviate poverty
    through sustainable community forestry and African drylands ‘regreening’ projects ITF’s projects involve
    planting trees that provide food and income as well as improved soil and water quality for communities;
    our sustainable approach to community forestry simultaneously addresses poverty and environmental issues
    such as habitat restoration. There are often also fundamental rights issues involved in our projects such
    as access to ancestral land.",
    photo_urls: photo_urls_international,
    logo: "http://gyr.fortlauderdale.gov/Home/ShowImage?id=2024&t=635657287021200000" }
]

project_attributes.each do |attr|
  project = Project.new(attr)
  project.save!
end

puts "Projects created"

# creating trips for Nathan
trip1 = Trip.create!(
  user: User.first,
  start_address: "Paris",
  destination_address: "Bordeaux",
  transportation: Transportation.where(category: "Train").first,
  km: 499.3,
  number: 1
)

trip2 = Trip.create!(
  user: User.first,
  start_address: "12 avenue Thiers, 33100 Bordeaux",
  destination_address: "64 rue de la Santé 75014 Paris",
  transportation: Transportation.where(category: "Avion").first,
  km: 495.33,
  number: 2
)

trip3 = Trip.create!(
  user: User.first,
  start_address: "Bordeaux",
  destination_address: "Manciet",
  transportation: Transportation.where(category: "Moto").first,
  km: 125.57,
  number: 2
)

trip4 = Trip.create!(
  user: User.first,
  start_address: "Bordeaux",
  destination_address: "Amsterdam",
  transportation: Transportation.where(category: "Voiture").first,
  km: 928.62,
  number: 8
)

# trips for everybody except Nathan
User.all[1..-1].each do |user|
  rand(8..12).times do
    trip = Trip.create!(user: user,
      start_address: Faker::Address.city,
      destination_address: Faker::Address.city,
      transportation: Transportation.all.sample,
      km: rand(40000..50000),
      number: rand(1..10) )
  end
end

puts "trips created"

# compensations for Nathan's trips

trip1 = Trip.first
comp = Compensation.new
comp.project =  Project.all.sample
# calculating total co2 emission and translate it into an amount
total_to_pay = (co2_to_euro(trip1.km, trip1.transportation.emission, trip1.number, comp.project.carbon)).round(2)

comp.amount = total_to_pay
comp.save!
puts "km: #{trip1.km} emission: #{trip1.transportation.emission} number: #{trip1.number} carbon #{comp.project.carbon
}"
puts total_to_pay
trip1.update!(compensation: comp)

trip4 = User.first.trips.last
comp = Compensation.new
comp.project =  Project.all.sample
# calculating total co2 emission and translate it into an amount
total_to_pay = (co2_to_euro(trip4.km, trip4.transportation.emission, trip4.number, comp.project.carbon)).round(2)

comp.amount = total_to_pay
comp.save!
puts "km: #{trip4.km} emission: #{trip4.transportation.emission} number: #{trip4.number} carbon #{comp.project.carbon
}"
puts total_to_pay
trip4.update!(compensation: comp)


# MAKING RANDOM COMPENSATIONS FOR RANDOM USERS' TRIPS
Trip.all[4..-1].each do |trip|
  if [true].sample # all trips will be compensated, original: if [true, false].sample
    comp = Compensation.new
    comp.project =  Project.all.sample
    # calculating total co2 emission and translate it into an amount
    total_to_pay = (co2_to_euro(trip.km, trip.transportation.emission, trip.number, comp.project.carbon)).round(2)

    comp.amount = total_to_pay
    comp.save!
    puts "Compensated trip: km: #{trip.km} emission: #{trip.transportation.emission} number: #{trip.number} carbon #{comp.project.carbon
    }"
    puts "To pay: #{total_to_pay} euros"
    trip.update!(compensation: comp)
  end
end

puts "Compensations created"
puts "End of seed"
