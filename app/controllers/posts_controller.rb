class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_post, only: [:index, :search]


  def index
    @posts = Post.includes(:user).order("created_at DESC")
    set_category_column
  end

  # def new
  #   @post = Post.all
  # end

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

  def search
    @results = @p.result.includes(:category)
  end

  private

  def search_post
    @p = Post.ransack(params[:q])
  end



  # def create
  #   @post = Post.new(item_params)
  #   if @post.valid?
  #     @post.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  private
  def post_params
    params.require(:post).permit(:fact, :notice, :image, :category_id).merge(user_id: current_user.id)
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end

end
