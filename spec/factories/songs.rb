FactoryBot.define do
  factory :song do
    title { Faker::TwinPeaks.location }
    user
  end
end
