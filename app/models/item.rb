class Item < ApplicationRecord
  validates :image, presence: {message: '選択されていません'}
  validates :name, presence: true
  validates :introducton, presence: true
  validates :price, numericality: {only_integer: true}

  belongs_to :genre
  has_many :order_details
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('./app/assets/images/default-image.jpg')
      image.attach(io:File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
