# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    sort { Faker::Lorem.word }
    price { Faker::Avatar }
    seat { rand(1..100) }
  end
end
