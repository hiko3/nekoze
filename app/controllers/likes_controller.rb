class LikesController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
	  	like = current_user.likes.build(like_params)
	  	like.save
	  	redirect_to post_path(post)
	end

	def destroy
		post = Post.find(params[:post_id])
	  	like = current_user.likes.find_by(like_params)
	  	like.destroy
	  	redirect_to post_path(post)
	end


private

	def like_params
		params.permit(:post_id)
	end
end