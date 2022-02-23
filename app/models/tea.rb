class Tea < ApplicationRecord
  has_many :subscriptions

  validate_presence_of :title, :description, :brew_time
end
