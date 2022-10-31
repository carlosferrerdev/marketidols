class Idol < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :orders, dependent: :destroy

  has_many_attached :photos
  validates :name, presence: true
  validates :power, presence: true, uniqueness: true
end
