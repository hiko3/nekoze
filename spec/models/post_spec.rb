require 'rails_helper'
RSpec.describe Post, type: :model do

	context "データが正しく保存される" do
		before do
			@post = Post.new
			@post.title = "Hello Cat"
			

end