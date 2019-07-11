class Post < ApplicationRecord

	belongs_to :user
	has_many   :photos, dependent: :destroy
	has_many   :likes, dependent: :destroy
	has_many   :comments, dependent: :destroy
	validates  :title, presence: true, length: { maximum: 30 }
	validates  :body, length: { maximum: 60 }

	accepts_nested_attributes_for :photos
	# accepts_attachments_for :photos, attachment: :image

	def liked_by?(user)
		Like.where(user_id: user.id, post_id: id) #user_idとpost_idが一致するlikeを検索する
	end
end
