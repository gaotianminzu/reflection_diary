class ChartsController < ApplicationController

def index

  @thanks = Post.where(user_id: current_user.id, category_id: 1).count
  @lesson = Post.where(user_id: current_user.id, category_id: 2).count
  @emotion = Post.where(user_id: current_user.id, category_id: 3).count

  @thanks_all = Post.count
  @lesson_all = Post.count
  @emotion_all = Post.count
  
end

end
