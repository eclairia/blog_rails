class Category < ApplicationRecord
  has_many :articles

  ###########################################

  validates :title, presence: true, length: { maximum: 20 }
end
