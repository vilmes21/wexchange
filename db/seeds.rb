# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding Tag
# les_tags = ["Like New", "Slightly Used", "Moderately Used", "Kids", "Bikes", "Books", "Household", "Furniture", "Phones", "Clothes", "Computers", "Electronics", "Music Instruments", "Appliances", "Food", "Other", "Finance", "Office", "Engineering", "Art/Media/Design", "Science", "Business", "Education", "Tutoring", "General", "Sports", "Legal", "Health", "Gardening", "Tech", "Writing", "Language", "Nonprofit"]
# les_tags.each {|tag| Tag.create({name: tag})}

# Seeding Post
# 150.times do
#   Request.create({title: ("I am "+ Faker::Company.name),
#   message: "Cest un request msg.",
#   post_id: rand(47)+56,
#   user_id: 1,
#   offer: [User.find(1).posts].pluck(:id)})
# end
#
# Request.find_each do |x|
#   x.offer = [65, 75, 77, 78, 84, 90, 93].sample
#   x.save
# end

# 50.times do
#   Post.create({title: Faker::Company.name,
#   description: Faker::Company.catch_phrase,
#   value: rand(55),
#   user_id: (rand(9)+1),
#   location: Faker::Address.street_address,
#   category: ['Item', 'Service'].sample})
# end
