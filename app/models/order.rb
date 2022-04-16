class Order < ApplicationRecord
  validates :order_date, presence: true
  validates :expiry,     presence: true
  validates :license,    presence: true

  has_many :services, through: :service_order
  has_one :prospect
  belongs_to :user
  belongs_to :client
end
