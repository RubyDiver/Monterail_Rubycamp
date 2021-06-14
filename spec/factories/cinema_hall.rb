# frozen_string_literal: true

FactoryBot.define do
  factory :cinema_hall do
    hall_name { 'Test cinema hall' }
    volume { rand(100..200) }
  end
end
