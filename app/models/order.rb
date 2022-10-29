class Order < ApplicationRecord
  belongs_to :user
  belongs_to :idol

  validates :price
  validates :idol_id
end
