# frozen_string_literal: true

FactoryBot.define do
  factory :seance do
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
