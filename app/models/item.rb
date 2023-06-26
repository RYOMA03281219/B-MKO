class Item < ApplicationRecord
  validates :image, presence: {message: '選択されていません'}
  validates :name, presence: true
  validates :introducton, presence: true
  validates :price, numericality: {only_integer: true}

  belongs_to :genre
  belongs_to :customer
  has_many :order_details

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('./app/assets/images/noimage.jpg')
      image.attach(io:File.open(file_path), filename: 'noimage.jpg',content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
