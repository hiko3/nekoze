class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

	def after_sign_in_path_for(resource)
  	root_path
  end

	def after_sign_out_path_for(resource)
    root_path
  end

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page]).reverse_order
    @q = params[:q]
  end


	protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end