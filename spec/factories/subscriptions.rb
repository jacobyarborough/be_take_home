FactoryBot.define do 
  factory :subscription do 
    title { Faker::Tea.variety }
    price { Faker::Number.decimal(l_digits: 2) }
    frequency { Faker::Lorem.sentence(word_count: 3) }
  end 
end 