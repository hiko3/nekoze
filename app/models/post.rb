class Post < ApplicationRecord

	belongs_to :user
	has_many   :photos
	validates  :title, presence: true, length: { maximum: 30 }
	validates  :body, length: { maximum: 30 }

	accepts_nested_attributes_for :photos, allow_destroy: true
end
