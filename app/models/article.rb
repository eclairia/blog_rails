class Article < ApplicationRecord

  include Sluggable

	###########################################

	has_many :comments, dependent: :destroy
  belongs_to :admin
  belongs_to :category

	###########################################

	validates :title, presence: true, length: { in: 7..100 }, uniqueness: true
  validates :text, presence: true, length: { minimum: 100 }
  validates :image, presence: true

	###########################################

	scope :published, -> (online) { where(online: online) }
  scope :language, -> (language) { where(language: language) }
  #scope :category, -> (category) { where category: category }

  mount_uploader :image, ImageUploader

	def self.search(search)
		if search
			where(Article.arel_table[:title].matches("%#{search}%"))
		else
			all
		end
	end
end