class Api::V1::CustomerSubscriptionsController < ApplicationController 
  def create
    new_sub = CustomerSubscription.create!(subscription_id: subscription_params[:subscription_id], customer_id: subscription_params[:customer_id], status: 'active')
    render json: CustomerSubscriptionSerializer.new(new_sub)
  end 

  def update
    sub = CustomerSubscription.find(subscription_params[:subscription_id], subscription_params[:subscription_id])
    sub.update(status: "canceled")
    render json: CustomerSubscriptionSerializer.new(sub)
  end 

  private 

  def subscription_params
    binding.pry
    JSON.parse(request.body.string, symbolize_names: :true)
  end 
end 