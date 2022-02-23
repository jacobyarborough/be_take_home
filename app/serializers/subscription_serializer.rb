class SubscriptionSerializer 
  include JSONAPI::Serializer 

  set_id :id
  set_type 'subscription'
  attributes :title, :price, :frequency, :tea_id
end 