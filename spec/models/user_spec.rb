require 'rails_helper'

RSpec.describe User, type: :model do

	context "データが正しく保存される" do
		before do
			@user = User.new
			@user.name = 'tarou'
			@user.email = 'hoge@example.com'
			@user.password = 'password'

			# @user.introduction = "よろしくお願いします"
			# @user.profile_image = File.open(Rails.root.join("app/assets/images", "no-image-post.jpg"), 'r')
			@user.save
		end
		it "正しく入力されているので保存される" do
			expect(@user).to be_valid
		end
	end
end
