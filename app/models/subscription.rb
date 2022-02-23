class Subscription < ApplicationRecord
  belongs_to :tea
  validates_presence_of :title, :price, :frequency, :tea_id
end
