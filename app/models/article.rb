class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
  belongs_to :user

	validates :title, presence: true, length: { minimum: 5 }

	scope :published, -> (online) { where(online: online) }

  mount_uploader :image, ImageUploader

	def self.search(search)
		if search
			where(Article.arel_table[:title].matches("%#{search}%"))
		else
			all
		end
	end
end