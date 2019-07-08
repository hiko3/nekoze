class PostsController < ApplicationController

	before_action :authenticate_user!

  def new
  	@post = Post.new
  	@post.photos.build
  end

  def create
  	@post = Post.new(post_params)
  	if @post.photos.present?
  	   @post.save
  	   redirect_to root_path
  	   flash[:notice] = "投稿されました"
  	else
  		redirect_to new_post_path
  		flash[:error] = "投稿に失敗しました"
  	end
  end

  def show
  end

  def index
  	@posts = Post.all.order('created_at DESC')
  end


  private

  	def post_params
  		params.require(:post).permit(:title, :body,
  			photos_attributes: [image: []]).merge(user_id: current_user.id)
  	end

  	# def post_params
  	# 	params.require(:post).permit(:title, :body, photo.image :[])
  	# end
end
