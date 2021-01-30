class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :search_post, only: [:show, :search_me]

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.includes(:user).order("created_at DESC")
    set_category_column
  end

  # カテゴリ検索条件にマッチしたPost情報を取得
  def search_me
    @results = @p.result.includes(:category)
  end

  private

  #カテゴリ検索の検索パラメーターを取得し、検索オブジェクトを生成
  def search_post
    @p = Post.where(user_id: current_user.id).ransack(params[:q])
  end


  #カテゴリ検索のプルダウンメニュー
  def set_category_column
    @category_name = Category.select("name").distinct
  end

end
