class ChartsController < ApplicationController

def index

  @thanks = Post.where(user_id: current_user.id, category_id: 1).count
  @lesson = Post.where(user_id: current_user.id, category_id: 2).count
  @emotion = Post.where(user_id: current_user.id, category_id: 3).count
  @usercount = Post.where(user_id: current_user.id).count
  @thanks_blm = @thanks / @usercount.to_f * 100
  @lesson_blm = @lesson / @usercount.to_f * 100
  @emotion_blm = @emotion / @usercount.to_f * 100
 

  @thanks_all = Post.where(category_id: 1).count
  @lesson_all = Post.where(category_id: 2).count
  @emotion_all = Post.where(category_id: 3).count
  @allcount = Post.count

  @thanks_all_blm = @thanks_all / @allcount.to_f * 100
  @lesson_all_blm = @lesson_all / @allcount.to_f * 100
  @emotion_all_blm = @emotion_all / @allcount.to_f * 100
  
end

end
