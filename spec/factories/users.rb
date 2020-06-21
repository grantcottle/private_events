FactoryBot.define do
  factory :user do
    username { 'demo'}
    email { 'demo@example.com' } 
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :random_user do
    username { Faker::Internet.username }
    email { Faler::Internet.safe_email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
