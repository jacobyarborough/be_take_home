FactoryBot.define do 
  factory :customer_subscription do 
    subscription_id { Faker::Number.between(from: 1, to: 5) }
    status { ["active", "canceled" ].sample }
  end 
end 