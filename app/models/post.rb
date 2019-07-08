class Post < ApplicationRecord

	belongs_to :user
	has_many   :photos, dependent: :destroy
	validates  :title, presence: true, length: { maximum: 30 }
	validates  :body, length: { maximum: 30 }

	accepts_nested_attributes_for :photos
	# accepts_attachments_for :photos, attachment: :image
end
