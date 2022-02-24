require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do 
  let!(:teas) { create_list(:tea, 2) }
  let!(:subscription1) { create(:subscription, frequency: 'weekly', tea_id: teas.first.id) }
  let!(:subscription2) { create(:subscription, frequency: 'biweekly', tea_id: teas.last.id) }
  let!(:customer) { create(:customer) }
  let!(:customer_subscription1) { create(:customer_subscription, customer_id: customer.id, subscription_id: subscription1.id, status: 'active') }
  let!(:customer_subscription2) { create(:customer_subscription, customer_id: customer.id, subscription_id: subscription2.id, status: 'canceled') }

  describe 'GET /api/v1/subscriptions' do
    let(:params) { {"customer_id": customer.id } }
    before { get "/api/v1/subscriptions", params: params }

    context 'when the request is valid' do 
      it 'returns all subscriptions for a customer' do 
        subs = JSON.parse(response.body, symbolize_names: :true)[:data]
        expect(subs).not_to be_empty
        expect(subs).to be_an(Array)
        expect(subs.count).to eq(2)
        expect(subs[0][:type]).to eq('subscription')
        expect(subs[0]).to have_key(:id)
        expect(subs[0][:id]).to be_a(String)
        expect(subs[0][:attributes]).to be_a(Hash)
        expect(subs[0][:attributes]).to have_key(:title)
        expect(subs[0][:attributes][:title]).to be_a(String)
        expect(subs[0][:attributes]).to have_key(:price)
        expect(subs[0][:attributes][:price]).to be_a(Float)
        expect(subs[0][:attributes]).to have_key(:frequency)
        expect(subs[0][:attributes][:frequency]).to be_a(String)
        expect(subs[0][:attributes]).to have_key(:tea_id)
        expect(subs[0][:attributes][:tea_id]).to be_an(Integer)
      end 

      it 'returns status code 201' do 
        expect(response).to be_successful 
        expect(response).to have_http_status(200)
      end 
    end 

    context 'the customer does not exist' do 
      let(:params) { {"customer_id": 1000001}}
    end 
  end 
end 