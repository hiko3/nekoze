class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

  def new
  	@post = Post.new
  end


  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
	if @post.save
	   redirect_to root_path
	   flash[:notice] = "投稿されました"
	else
		flash.now[:alert] = "投稿に失敗しました"
		render :new
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
  	if current_user != @post.user
  	flash[:alert] = "編集権限がありません"
    redirect_to posts_path
	end
  end


  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		flash[:notice] = "投稿内容を編集しました"
  		redirect_to post_path(@post)
  	else
  		flash.now[:alert] = "編集に失敗しました"
  		render :edit
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
  	end

end
