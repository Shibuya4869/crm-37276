class Service < ApplicationRecord
  validates :name,  presence: true
  validates :price, presence: true

  has_many :clients, through: :client_service
  has_many :prospects
  has_many :orders, through: :service_order
end
