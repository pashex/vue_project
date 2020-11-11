class Client < ApplicationRecord
  include Authable

  validates :fullname, presence: true
end
