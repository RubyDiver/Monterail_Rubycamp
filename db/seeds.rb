# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CinemaHall.destroy_all
Seance.destroy_all
Movie.destroy_all

require 'faker'

(1..15).each do |id|
  Movie.create!(
    id: id,
    name: Faker::Fantasy::Tolkien.poem,
    genre: Faker::Movie.title
  )
end

(1..1).each do |id|
  CinemaHall.create!(
      hall_name: Faker::FunnyName.two_word_name,
      volume: Faker::Number.number(digits: 3 )
  )
end

(1..4).each do |id|
  CinemaHall.create!(
    hall_name: Faker::FunnyName.two_word_name,
    volume: Faker::Number.number(digits: 3)
  )
end

(1..4).each do |id|
  CinemaHall.create!(
    hall_name: Faker::FunnyName.three_word_name,
    volume: Faker::Number.number(digits: 2)
  )
end

(1..1).each do |id|
  CinemaHall.create!(
    hall_name: Faker::FunnyName.three_word_name,
    volume: Faker::Number.number(digits: 2)
  )
end
