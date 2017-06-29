class Towa < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :towa, presence: true, length: { maximum: 20 }, uniqueness: true
  has_many :meanings, dependent: :destroy
  accepts_nested_attributes_for :meanings
end
