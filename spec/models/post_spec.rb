require 'rails_helper'

RSpec.describe Post, type: :model do
		let(:user) { User.create!(email: 'hoge@example.com', name: 'name', password: 'password') }

		context "データが正しく保存される" do
			before do
				@post = Post.new
				@post.user = user
				@post.title = "Hello World"
				@post.body = "いい天気ですね"
				@post.image = File.open(Rails.root.join("app/assets/images", "no-image-post.jpg"), 'r')
				@post.save
			end
			it "正しく入力してあるので保存される" do
				expect(@post).to be_valid
			end
		end

		context "データが正しく保存されない" do
			before do
				@post = Post.new
				@post.title = ""
				@post.body = "いい天気ですね"
				@post.image = File.open(Rails.root.join("app/assets/images", "no-image-post.jpg"), 'r')
				@post.save
			end
			it "titleが正しく入力されていないので保存されない" do
				expect(@post).to be_invalid
			end
		end

		context "データが正しく保存されない" do
			before do
				@post = Post.new
				@post.title = "Hello World"
				@post.body = "いい天気ですね"
				@post.image = ""
				@post.save
			end
			it "imageがアップロードされていないので保存されない" do
				expect(@post).to be_invalid
			end
		end
end


