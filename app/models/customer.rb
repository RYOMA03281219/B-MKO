class Customer < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :items
  has_many :addresses

  def active_for_authentication?
    super && (is_delete == false)
  end
  
  def password_reset_expired?
      reset_sent_at < 2.hours.ago
  end
end
