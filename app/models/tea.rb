class Tea < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  validates_presence_of :title, :description, :brew_time
end
