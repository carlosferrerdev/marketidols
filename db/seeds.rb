# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

3.times do
  user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6)
  )
  3.times do
  idol = Idol.create(
        name: Faker::Superhero.name,
        power: Faker::Superhero.power,
        address: Faker::Nation.capital_city,
        description: Faker::Quote.famous_last_words,
        price: Faker::Number.decimal(l_digits: 2),
        user: user
      )
        file = URI.open("https://source.unsplash.com/random/700x600/?#{idol.name}")
        idol.photos.attach(io: file, filename: 'user.png', content_type: 'image/png')
  end
end
# puts "Cleaning up database..."
# Idol.destroy_all
# puts "Database cleaned"

# 10.times do
#   user = User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(min_length: 6)
#   )

#   5.times do
#     idol = Idol.create(
#     name: Faker::Artist.name,
#     power: Faker::Superhero.power,
#     address: Faker::Address.full_address,
#     description: Faker::Superhero.descriptor,
#     price: Faker::Number.decimal(l_digits: 2),
#     user: user
#   )
#     file = URI.open("https://source.unsplash.com/random/700x600/?#{idol.name}")
#     idol.photos.attach(io: file, filename: 'user.png', content_type: 'image/png')
#   end
# end
