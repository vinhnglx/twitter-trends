FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.safe_email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    provider  "twitter"
    access_token SecureRandom.hex(32)
    twitter_secret SecureRandom.hex(32)
    first_visit false
    sequence(:uid) { |n| SecureRandom.hex(8) + "#{n}" }
    avatar FFaker::Avatar.image
  end
end
