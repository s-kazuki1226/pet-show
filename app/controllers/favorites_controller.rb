class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    flash[:success] = 'いいねしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.dislike(post)
    flash[:success] = 'いいねを取り消しました。'
    redirect_back(fallback_location: root_path)
  end
end
