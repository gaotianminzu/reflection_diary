class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :comments
  has_many :like
  has_many :categories
  enum status:{nonreleased: 0, released: 1}
  has_one_attached :image


  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def update_without_current_password(params, *options)
  params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


end
