class Api::V1::SubscriptionsController < ApplicationController 
  def index
    if !subscription_params[:customer_id] || subscription_params[:customer_id] == "" || subscription_params[:customer_id] == " "
      render json: { error: 'Customer is invalid or left blank', status: 404 }, status: 404
    elsif !Customer.exists?(subscription_params[:customer_id])
      render json: { error: 'Customer is invalid or left blank', status: 404 }, status: 404
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
