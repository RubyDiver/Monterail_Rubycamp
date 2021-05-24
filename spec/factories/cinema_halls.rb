FactoryBot.define do
  factory :cinema_hall do
    name {Faker::Lorem.word}
    volume {rand(100..200)}
  end
end