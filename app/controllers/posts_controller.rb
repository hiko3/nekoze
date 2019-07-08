class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

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
  	@post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all.order('created_at DESC')
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		flash[:notice] = "投稿内容を編集しました"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = "編集に失敗しました"
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if @post.user = current_user
  		flash[:notice] = "投稿を削除しました" if @post.destroy
  	else
  		flash[:error] = "削除に失敗しました"
  	end
  		redirect_to root_path
  end


  private

  	def post_params
  		params.require(:post).permit(:title, :body, :genre,
  			photos_attributes: [:image]).merge(user_id: current_user.id)
  	end

  	# def post_params
  	# 	params.require(:post).permit(:title, :body, photo.image :[])
  	# end
end
