require 'factory_bot_rails'
require 'faker'

10.times do 
  FactoryBot.create(:customer)
end 

5.times do 
  FactoryBot.create(:tea)
end 

(1..5).each do |i|
  FactoryBot.create(:subscription, tea_id: i)
end 

(1..10).each do |i|
  FactoryBot.create(:customer_subscription, customer_id: i)
end 