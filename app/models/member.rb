class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 20 }, presence: true
  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no-image.PNG'
  end
end
