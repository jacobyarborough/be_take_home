class Api::V1::SubscriptionsController < ApplicationController 
  def index
    if !subscription_params[:customer_id] || subscription_params[:customer_id] == "" || subscription_params[:customer_id] == " "
      render json: { error: 'Customer is invalid or left blank', status: 400 }, status: 400 
    elsif !Customer.find(subscription_params[:customer_id])
      render json: { error: 'Customer is invalid or left blank', status: 400 }, status: 400 
    else 
      customer = Customer.find(subscription_params[:customer_id])
      render json: SubscriptionSerializer.new(customer.subscriptions)
    end
  end 

  private 

  def subscription_params
    params.permit(:customer_id)
  end 
end 