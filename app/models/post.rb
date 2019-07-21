class Post < ApplicationRecord
	belongs_to :user
	has_many   :likes, dependent: :destroy
	has_many   :comments, dependent: :destroy
	validates  :title,
				presence: true,
				length: { maximum: 20 }
	validates  :body,
				length: { maximum: 120 }
	validates  :image,
				presence: true
				# file_content_type: { allow: ['image/jpeg','image/png'] }
	attachment :image, type: :image

	def liked_by?(user)
		Like.where(user_id: user.id, post_id: id) #user_idとpost_idが一致するlikeを検索する
	end
end
