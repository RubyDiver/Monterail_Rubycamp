# frozen_string_literal: true

FactoryBot.define do
  factory :ticket_desk do
    name { Faker::Lorem.word }
    online { true }
  end
end
