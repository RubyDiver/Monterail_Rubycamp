# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Lorem.name }
    real_user { "true" }
    age { rand(1..100) }
    email { 'pawel@example.com' }
  end
end
