class Meaning < ApplicationRecord
  validates :meaning, presence: true, length: { maximum: 108 }
  belongs_to :towa, optional: true
  belongs_to :user
  has_many :lights, dependent: :destroy
  def light_user(user_id)
    lights.find_by(user_id: user_id)
  end
end
