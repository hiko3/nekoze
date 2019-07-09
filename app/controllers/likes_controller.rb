class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
	  	like = current_user.likes.new(post_id: post.id)
	  	like.save
	  	redirect_to post_path(post)
	end

	def destroy
		post = Post.find(params[:post_id])
	  	like = current_user.likes.find_by(post_id: post.id)
	  	like.destroy
	  	redirect_to post_path(post)
	end


private
	
	def like_params
		params.permit(:post_id) #いいねを押したときに、どの投稿にいいねを押したのかpost_idの情報を変更できるように指定
	end
end