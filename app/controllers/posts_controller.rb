class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
	if @post.save!
	   redirect_to root_path
	   flash[:notice] = "投稿されました"
	else
		redirect_to new_post_path
		flash[:alert] = "投稿に失敗しました"
	end
  end

  def show
  	@post = Post.find(params[:id])
  	@comment = Comment.new
  end

  def index
  	@posts = Post.page(params[:page]).reverse_order
  	@rank = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
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
  		flash[:alert] = "編集に失敗しました"
  		redirect_to edit_post_path(@post)
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if @post.user = current_user
  		flash[:notice] = "投稿を削除しました" if @post.destroy
  	else
  		flash[:alert] = "削除に失敗しました"
  	end
  		redirect_to root_path
  end




  private

  	def post_params
  		params.require(:post).permit(:title, :body, :genre, :catname, :image)
  			# photos_attributes: [:image])#.merge(user_id: current_user.id)
  	end

  	# def post_params
  	# 	params.require(:post).permit(:title, :body, photo.image :[])
  	# end
end
