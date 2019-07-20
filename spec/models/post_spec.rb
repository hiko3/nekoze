require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "post_validation" do
		let(:user) { User.create!(email: 'hoge@example.com', name: 'name', password: 'password') }
		subject { Post.create(params).valid? }

  	context "画像がない場合" do
  		let(:params) do
				{
					title: "テスト",
					user: user,
					image_id: File.open(Rails.root.join("app/assets/images", "no-image-post.jpg"), 'r')
				}
			end
  		it "投稿を保存できない" do
		  	is_expected.to be_falsey
	  	end
		end
	end
end

