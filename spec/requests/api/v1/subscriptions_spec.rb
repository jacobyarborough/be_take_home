require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do 
  describe 'GET /api/v1/subscriptions' do 
    let(:teas) { create(:tea, 2) }
    let(:subscription1) { create(:subscription, frequency: 'weekly', tea_id: teas.first.id) }
    let(:subscription2) { create(:subscription, frequency: 'biweekly', tea_id: teas.last.id) }
    let(:customer) { create(:customer) }
    let(:customer_subscription1) { create(:customer_subscription, customer_id: customer.id, subscription_id: subscription1.id, status: 'active') }
    let(:customer_subscription2) { create(:customer_subscription, customer_id: customer.id, subscription_id: subscription2.id, status: 'canceled') }
    let(:params) { {"customer_id": customer.id } }
    before { get "/api/v1/subscriptions" ,params: params }

    context 'when the request is valid' do 
      it 'returns all subscriptions for a customer' do 
        subs = JSON.parse(response.body, symbolize_names: :true)[:data]
        binding.pry
        expect(subs).not_to be_empty
        expect(subs).to be_a(Hash)
        epect(subs[:type]).to eq('subscription')
        expect(subs).to have_key(:title)
      end 
    end 
  end 
end 