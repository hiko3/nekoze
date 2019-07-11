class RelationshipsController < ApplicationController

	def create
		user = User.find(params[:user_id])
		follow = current_user.active_relationships.build(follower_id: user.id)
		if follow.save
			flash[:notice] = "フォローしました"
			redirect_to user_path(user)
		end
	end

	def destroy
		user = User.find(params[:user_id])
		follow = current_user.active_relationships.find_by(follower_id: user.id)
		if follow.destroy
			flash[:alert] = "フォロー解除しました"
			redirect_to root_path
		end
	end
end