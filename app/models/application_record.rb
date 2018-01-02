class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :alpha, -> { order(created_at: :desc) }
end
