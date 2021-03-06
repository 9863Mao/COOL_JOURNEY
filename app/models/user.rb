class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: {maximum:10}
  validates :last_name, presence: true, length: {maximum:10}
  validates :telephone_number, presence: true, length: {maximum:15}
  validates :user_nickname, presence: true, length: {maximum:20}

  # フォローした、されたの関係
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :reverse_of_follows, source: :follower
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments
  has_one_attached :profile_image

  scope :active_data, -> { where(is_active: false) }

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("user_nickname LIKE?", "#{word}")
    elsif search == "partial_match"
      @user = User.where("user_nickname LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  # フォローしたときの処理
  def follow(user_id)
    follows.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    follows.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
