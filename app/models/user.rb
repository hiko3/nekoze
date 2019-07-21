class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  # has_many :send_messages, class_name: "Message", foreign_key: :to_user_id
  # has_many :to_users, through: :send_messages, source: :from_user

  # has_many :receive_massages, class_name: "Message", foreign_key: :from_user_id
  # has_many :from_users, through: :from_messages, source: :to_user

  attachment :profile_image

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 120 }


#フォロー済みかどうか判定するメソッド
  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  	# 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  end



  def posts
  	return Post.where(user_id: self.id)
  end
end
