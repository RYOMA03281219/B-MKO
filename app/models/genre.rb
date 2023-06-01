class Genre < ApplicationRecord
  validate :name, presence: true
  has_many :items, dependent: :destroy
end
