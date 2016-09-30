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
# 30.times do
#   Post.create({title: Faker::Pokemon.name,
#   description: Faker::Lorem.sentence,
#   value: rand(55),
#   user_id: (rand(9)+1),
#   location: Faker::Address.street_address,
#   duration: rand(6),
#   category: ['Item', 'Service'].sample})
# end

#after setting up STI
# Post.find_each do |x|
#  x.type = ["Item", "Service", "Volunteer"].sample
#  x.save
# end
