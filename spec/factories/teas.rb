FactoryBot.define do 
  factory :teas do 
    title { Faker::Tea.variety }
    description { Faker::Lorem.scentences(number: 3) }
    brew_time { Faker::Number.between(from: 1, to :10) }
  end 
end 