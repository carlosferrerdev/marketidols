class Idol < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :power, presence: true, uniqueness: true
end
