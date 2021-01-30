class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, ->{ order(created_at: :desc)}, dependent: :destroy

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

  #キーワード検索
  def self.search_key(search_key)

        if search_key != ""
          Post.where('fact LIKE ?', "%#{search_key}%").or (where('notice LIKE ?', "%#{search_key}%"))
        else
          Post.all
        end
  end

#自分のDiary内のキーワード検索
  def self.my_search_key(my_search_key)

    if my_search_key != ""
      Post.where('fact LIKE ?', "%#{my_search_key}%").or (where('notice LIKE ?', "%#{my_search_key}%"))
    else
      Post.all
    end
end

end
