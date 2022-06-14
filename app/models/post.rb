class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
  
  has_one_attached :image
  
  geocoded_by :address
  after_validation :geocode
end
