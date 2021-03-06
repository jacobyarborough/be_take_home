require 'rails_helper'

RSpec.describe Tea, type: :model do
  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:brew_time) }
end
