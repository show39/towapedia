class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :password, length: {minimum: 6}
  has_many :meanings
  has_many :lights
  mount_uploader :thumbnail, ImageUploader
end
