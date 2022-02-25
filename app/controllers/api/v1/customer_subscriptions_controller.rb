class Api::V1::CustomerSubscriptionsController < ApplicationController 
  def create
    if !Subscription.exists?(subscription_params[:subscription_id]) || !Customer.exists?(subscription_params[:customer_id])
      render json: { error: 'Customer and or subscription is invalid or left blank', status: 404 }, status: 404
    else 
      new_sub = CustomerSubscription.create!(subscription_id: subscription_params[:subscription_id], customer_id: subscription_params[:customer_id], status: 'active')
      render json: CustomerSubscriptionSerializer.new(new_sub)
    end
  end 

  def update
    if !Subscription.exists?(subscription_params[:subscription_id]) || !Customer.exists?(subscription_params[:customer_id])
      render json: { error: 'Customer and or subscription is invalid or left blank', status: 404 }, status: 404
    else 
      sub = CustomerSubscription.find_by(customer_id: subscription_params[:customer_id], subscription_id: subscription_params[:subscription_id])
      sub.update(status: subscription_params[:status])
      render json: CustomerSubscriptionSerializer.new(sub)
    end 
  end 

  private 

  def subscription_params
    JSON.parse(request.body.string, symbolize_names: :true)
  end 
end 