class Prospect < ApplicationRecord
  validates :scheduled_order_date, presence: true
  validates :license,              presence: true

  belongs_to :user
  belongs_to :service
  belongs_to :client
  has_one :order

end
