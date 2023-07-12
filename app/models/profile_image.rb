class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
end
