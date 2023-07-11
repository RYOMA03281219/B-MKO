class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items
  has_many :addresses
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # def active_for_authentication?
  #   super && (is_delete == false)
  # end

  def password_reset_expired?
      reset_sent_at < 2.hours.ago
  end
end
