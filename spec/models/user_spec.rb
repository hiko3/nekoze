require 'rails_helper'

RSpec.describe User, type: :model do

	context " emailが空の時、データが正しく保存されない" do
		before do
			@user = User.new
			@user.name = 'tarou'
			@user.email = ''
			@user.password = 'password'
			@user.save
		end
		it "正しく入力されていないので保存されない" do
			expect(@user).to be_invalid
		end
	end

	context "passwordが空の時、データが正しく保存されない" do
		before do
			@user = User.new
			@user.name = "tarou"
			@user.email = 'hoge@example.com'
			@user.password = ''
			@user.save
		end
		it "正しく入力されていないので保存されない" do
			expect(@user).to be_invalid
		end
	end

	context "データが正しく保存される" do
		before do
			@user = User.new
			@user.name = 'tarou'
			@user.email = 'hoge@example.com'
			@user.password = 'password'
			@user.save
		end
		it "正しく入力されているので保存される" do
			expect(@user).to be_valid
		end
	end
end
