# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'demo' }
    email { 'demo@example.com' }
    password { 'password' }
    password_confirmation { 'password' }

    factory :random_user do
      username { Faker::Internet.username }
      email { Faker::Internet.safe_email }
    end
  end
end
