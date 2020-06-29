include ActionDispatch::TestProcess
FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word  }
    description { Faker::Lorem.sentence }
    date {Faker::Time.between(from: DateTime.now - 30, to: DateTime.now + 50) }
    location { Faker::Address.street_name }
    creator { nil }
  end
end
