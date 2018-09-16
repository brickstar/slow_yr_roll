FactoryBot.define do
  factory :user do
    provider { "google" }
    uid { "105277822459143982535"}
    first_name { Faker::TwinPeaks.character }
    last_name { "Bricker" }
    email {  "brickstar@gmail.com" }
    token { 'blah' }
  end
end
