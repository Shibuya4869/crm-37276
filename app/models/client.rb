class Client < ApplicationRecord
  validates :name, presence: true

  has_many :services, through: :client_service
  has_many :orders
  has_many :prospects
end
