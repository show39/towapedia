class Meaning < ApplicationRecord
  validates :meaning, presence: true, length: { maximum: 108 }
  belongs_to :towa, optional: true
  belongs_to :user
end
