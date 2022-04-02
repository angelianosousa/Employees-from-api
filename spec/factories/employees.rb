FactoryBot.define do
  factory :employee do
    title { %w[Mr Miss].sample }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender { %w[male female].sample }
  end
end