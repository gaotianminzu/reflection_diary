class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_post, only: [:index, :search, :search_me]


  def index
    @posts = Post.includes(:user).order("posts.created_at DESC").joins(:user).where(users: {status: "1"})
    set_category_column
  end


  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path;
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path;
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path;
  end

  def edit
    @post = Post.find(params[:id])
  end

 
  #キーワード検索の結果取得
  def search_key
    @posts = Post.search_key(params[:keyword]).order("created_at DESC")
  end

   
  #自分のDiary内のキーワード検索の結果取得
  def my_search_key
    @posts = Post.where(user_id: current_user.id).search_key(params[:keyword])
  end

  # カテゴリ検索条件にマッチしたPost情報を取得
  def search
    @results = @p.result.includes(:category)
  end

  def search_me
    @results = @p_me.result.includes(:category)
  end


  private

  #カテゴリ検索の検索パラメーターを取得し、検索オブジェクトを生成
  def search_post
    @p = Post.ransack(params[:q])
    @p_me = Post.where(user_id: current_user.id).ransack(params[:q])
  end

  

  #カテゴリ検索のプルダウンメニュー
  def set_category_column
    @category_name = Category.select("name").distinct
  end

  #DiaryのParams取得
  def post_params
    params.require(:post).permit(:fact, :notice, :image, :category_id).merge(user_id: current_user.id)
  end


end
