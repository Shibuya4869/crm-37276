class Service < ApplicationRecord
  validates :name,  presence: true
  validates :price, presence: true

  has_many :client_service
  has_many :service_prospect
  has_many :service_order
end
