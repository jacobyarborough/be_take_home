class Api::V1::SubscriptionsController < ApplicationController 
  def index
    customer = Customer.find(subscription_params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end 

  private 

  def subscription_params
    params.permit(:customer_id)
  end 
end 