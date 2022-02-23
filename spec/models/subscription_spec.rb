require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should belong_to(:tea) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:frequency) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:tea_id) }
end
