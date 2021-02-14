class FollowsController < ApplicationController

  def index
    follows = Follow.where(user_id: current_user.id)
    posts_user_ids =follows.map(&:following_user_id)
    @posts = Post.where(user_id: posts_user_ids)
    @user_ids = @posts.select(:user_id).distinct
    @user_ids2=  Follow.where(following_user_id: current_user.id)

    @users = User.where.not(id:current_user.id)
    @self = User.find_by(id:current_user.id)
  end

  def create

    @follow = Follow.new
    @follow.user_id = params[:user_id]
    @follow.following_user_id = params[:following_user_id]
    if @follow.save
      redirect_to follows_path;
    else
      render :index
    end
  end

  def destroy
    @follow = Follow.find_by(params[:id])
    @follow.destroy
    redirect_to follows_path;
  end

  private

  def set_follow
    follows = Follow.where(user_id: current_user.id)
    posts_user_ids =follows.map(&:following_user_id)
    @posts = Post.where(user_id: posts_user_ids)
    @user_ids = @posts.select(:user_id).distinct
    @user_ids2=  Follow.where(following_user_id: current_user.id)

    @users = User.where.not(id:current_user.id)
    @self = User.find_by(id:current_user.id)
  end

end
