class Prospect < ApplicationRecord
  validates :scheduled_order_date, presence: true
  validates :license,              presence: true

  # has_many :services, through: :service_prospect
  has_many :service
  belongs_to :user
  # belongs_to :order
  belongs_to :client
end