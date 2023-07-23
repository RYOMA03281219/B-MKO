class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :review, presence: true
  validate :image_type

  belongs_to :genre
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image


  def image_type
    if image.attached? == true
      unless image.blob.content_type == "image/jpeg" || image.blob.content_type == "image/png"
        errors.add(:image, "画像ファイルはjpeg、pngを指定してください。")
      end
    end
  end

  def get_image(width, height)
    if image.blob.content_type == "image/avif"
      file_path = Rails.root.join('./app/assets/images/noimage.jpg')
      image.attach(io:File.open(file_path), filename: 'noimage.jpg',content_type: 'image/jpeg')
    end
    unless image.attached?
      file_path = Rails.root.join('./app/assets/images/noimage.jpg')
      image.attach(io:File.open(file_path), filename: 'noimage.jpg',content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end


