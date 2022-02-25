require 'rails_helper'

RSpec.describe 'Customer Subscriptions', type: :request do 
  let!(:teas) { create_list(:tea, 2) }
  let!(:subscription1) { create(:subscription, frequency: 'weekly', tea_id: teas.first.id) }
  let!(:subscription2) { create(:subscription, frequency: 'biweekly', tea_id: teas.last.id) }
  let!(:customer) { create(:customer) }
  let!(:customer_subscription1) { create(:customer_subscription, customer_id: customer.id, subscription_id: subscription1.id, status: 'active') }
  let!(:customer_subscription2) { create(:customer_subscription, customer_id: customer.id, subscription_id: subscription2.id, status: 'canceled') }

  describe 'Post /api/v1/customer_subscriptions' do
    let(:body) { {"customer_id": customer.id, "subscription_id": subscription1.id,  status: 'active'} }
    let(:headers) { {"CONTENT_TYPE" => "application/json"} }
    before { post "/api/v1/customer_subscriptions", headers: headers, params: body.to_json }

    context 'when the request is valid' do 
      it 'returns all subscriptions for a customer' do 
        sub = JSON.parse(response.body, symbolize_names: :true)[:data]
        expect(sub).not_to be_empty
        expect(sub).to be_a(Hash)
        expect(sub.count).to eq(3)
        expect(sub[:type]).to eq('customer_subscription')
        expect(sub).to have_key(:id)
        expect(sub[:id]).to be_a(String)
        expect(sub[:attributes]).to be_a(Hash)
        expect(sub[:attributes]).to have_key(:customer_id)
        expect(sub[:attributes][:customer_id]).to be_an(Integer)
        expect(sub[:attributes]).to have_key(:subscription_id)
        expect(sub[:attributes][:subscription_id]).to be_an(Integer)
        expect(sub[:attributes]).to have_key(:status)
        expect(sub[:attributes][:status]).to be_a(String)
      end 

      it 'returns status code 200' do 
        expect(response).to be_successful 
        expect(response).to have_http_status(200)
      end 
    end 

    context 'the customer does not exist' do 
      let(:body) { {"customer_id": 1000005, "subscription_id": subscription1.id, status: 'canceled'} }

      it 'returns a 404 error message' do 
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Customer and or subscription is invalid or left blank/)
      end 
    end 

    context 'the subscription does not exist' do 
      let(:body) { {"customer_id": customer.id, "subscription_id": 100005, status: 'canceled'} }

      it 'returns a 404 error message' do 
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Customer and or subscription is invalid or left blank/)
      end 
    end 
  end 

  describe 'Put /api/v1/customer_subscriptions' do
    let(:body) { {"customer_id": customer.id, "subscription_id": subscription1.id, status: 'canceled'} }
    let(:headers) { {"CONTENT_TYPE" => "application/json"} }
    before { put "/api/v1/customer_subscriptions", headers: headers, params: body.to_json }

    context 'when the request is valid' do 
      it 'returns all subscriptions for a customer' do 
        sub_update = JSON.parse(response.body, symbolize_names: :true)[:data]
        expect(sub_update).not_to be_empty
        expect(sub_update).to be_a(Hash)
        expect(sub_update.count).to eq(3)
        expect(sub_update[:type]).to eq('customer_subscription')
        expect(sub_update).to have_key(:id)
        expect(sub_update[:id]).to be_a(String)
        expect(sub_update[:attributes]).to be_a(Hash)
        expect(sub_update[:attributes]).to have_key(:customer_id)
        expect(sub_update[:attributes][:customer_id]).to be_an(Integer)
        expect(sub_update[:attributes]).to have_key(:subscription_id)
        expect(sub_update[:attributes][:subscription_id]).to be_an(Integer)
        expect(sub_update[:attributes]).to have_key(:status)
        expect(sub_update[:attributes][:status]).to be_a(String)
        expect(sub_update[:attributes][:status]).to eq('canceled')
      end 

      it 'returns status code 200' do 
        expect(response).to be_successful 
        expect(response).to have_http_status(200)
      end 
    end 

    context 'the customer does not exist' do 
      let(:body) { {"customer_id": 1000005, "subscription_id": subscription1.id, status: 'canceled'} }

      it 'returns a 404 error message' do 
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Customer and or subscription is invalid or left blank/)
      end 
    end 

    context 'the subscription does not exist' do 
      let(:body) { {"customer_id": customer.id, "subscription_id": 100005, status: 'canceled'} }

      it 'returns a 404 error message' do 
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Customer and or subscription is invalid or left blank/)
      end 
    end 
  end 
end 