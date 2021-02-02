class FollowsController < ApplicationController

  def index
    follows = Follow.where(user_id: current_user.id)
    posts_user_ids =follows.map(&:following_user_id)
    @posts = Post.where(user_id: posts_user_ids)
  end

  def create

    @follow = Follow.new
    @follow.user_id = params[:user_id]
    @follow.following_user_id = params[:following_user_id]
    if @follow.save
      redirect_to users_path;
    end
  end

  def destroy
    @follow = Follow.find_by(params[:id])
    @follow.destroy
    redirect_to users_path;
  end

end
