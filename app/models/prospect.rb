class Prospect < ApplicationRecord
  validates :scheduled_order_date, presence: true
  validates :license,              presence: true

  # has_many :services, through: :service_prospect
  belongs_to :service
  belongs_to :user
  belongs_to :client
  # belongs_to :order

end
