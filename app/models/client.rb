class Client < ApplicationRecord
  validates :name, presence: true

  has_many :client_service
  has_many :orders
  has_many :prospects
  belongs_to :user
end
