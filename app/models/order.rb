class Order < ApplicationRecord
  belongs_to :user
  belongs_to :idol

  validates :price, presence: true
end
