# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    name { Faker::Lorem.word }
    genre { Faker.genre.book }
  end
end
