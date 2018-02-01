class Category < ApplicationRecord
  has_many :articles

  ###########################################

  validates :title, presence: true, length: { in: 4..20 }, uniqueness: true
end
