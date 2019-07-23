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

  attachment :profile_image, type: :image

  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 120 }


#フォロー済みかどうか判定するメソッド
  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  	# 自分がフォローしようとしているユーザーがフォローされているユーザーの中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  end


#ユーザーに紐づいたpostインスタンスを戻り値として返すメソッド
  def posts
  	return Post.where(user_id: self.id)
  end
end
