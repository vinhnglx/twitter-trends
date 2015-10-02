FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    provider  "twitter"
    access_token SecureRandom.hex(32)
    twitter_secret SecureRandom.hex(32)
    first_visit false
    uid SecureRandom.hex(8)
    avatar FFaker::Avatar.image
  end
end
