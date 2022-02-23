class CustomerSubscriptionSerializer 
  include JSONAPI::Serializer 

  set_id :id
  set_type 'customer_subscription'
  attributes :customer_id, :subscription_id, :status
end 