class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # def active_for_authentication?
  #   super && (is_delete == false)
  # end

  def password_reset_expired?
      reset_sent_at < 2.hours.ago
  end

   def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('./app/assets/images/noimage.jpg')
      post_image.attach(io: File.open(file_path), filename: 'noimage.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
end
