class Client < ApplicationRecord
  include Authable

  validates :fullname, presence: true, length: { minimum: 5 }
  validates :phone, uniqueness: true, format: { with: /\A\d+\z/, message: 'must contain digits only' }
end
