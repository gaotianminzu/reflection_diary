class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, ->{ order(created_at: :desc)}, dependent: :destroy

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

end
