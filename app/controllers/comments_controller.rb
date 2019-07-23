class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
	    comment = current_user.comments.new(comment_params)
	    comment.post_id = post.id
	    if comment.save
	    	flash[:notice] = "コメントしました"
	    	redirect_to post_path(post)
	    else
	    	flash[:alert] = "コメントに失敗しました"
	    	redirect_to post_path(post)
		end
	end

	def destroy
		post = Post.find(params[:post_id])
		comment = current_user.comments.find(params[:id])
		comment.post_id = post.id
		comment.destroy
		redirect_to post_path(post)
	end


	private

	def comment_params
		params.require(:comment).permit(:user_id, :post_id, :comment)
	end
end

