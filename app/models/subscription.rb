class Subscription < ApplicationRecord
  belongs_to :tea
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
  validates_presence_of :title, :price, :frequency, :tea_id
end
