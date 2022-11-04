class Idol < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description, :price ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :orders, dependent: :destroy

  has_many_attached :photos
  validates :name, presence: true
  validates :power, presence: true, uniqueness: true
  validates :price, presence: true
end
