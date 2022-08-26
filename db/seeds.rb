# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

10.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password,
    bio: "Hello I am a bio that is more than ten!"
  )
  user.save!

  place = Listing.create(
    name: Faker::Address.community,
    address: Faker::Address.full_address,
    category: Faker::House.room,
    price: rand(10..500),
    rating: rand(1..5),
    description: "Hello this is a description",
    user_id: user.id,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
  file = URI.open("https://picsum.photos/200/300")
  place.photos.attach(io: file, filename:"filler.jpeg",content_type: "image/jpeg")
  file2 = URI.open("https://picsum.photos/200/300")
  place.photos.attach(io: file2, filename:"filler.jpeg",content_type: "image/jpeg")
  file3 = URI.open("https://picsum.photos/200/300")
  place.photos.attach(io: file3, filename:"filler.jpeg",content_type: "image/jpeg")
  place.save!
end
