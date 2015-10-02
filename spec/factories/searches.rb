FactoryGirl.define do
  factory :search do
    query { FFaker::Lorem.word }
    user
  end
end
