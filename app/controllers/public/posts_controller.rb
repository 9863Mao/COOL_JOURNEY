class Public::PostsController < ApplicationController
  
  #def index
  #  @posts = Post.all
  #end
  before_action :authenticate_user!, only: [:new, :create, :update]

  def new
    @post = Post.new
    @large_categories = Prefecture.all
    @medium_categories = City.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.address = "#{params[:post][:prefecture]}#{params[:post][:city]}#{params[:post][:address]}"
    @post.save
    redirect_to public_post_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    if user_signed_in?
      @comment = current_user.comments.new
      #@comment = Comment.new
    end    #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end
  
  def update
    @post = Post.find(params[:id])
    @user = current_user.id
    @post.update(post_params)
    redirect_to public_user_path(current_user.id)
  end
  
  def get_city
    prefecture_id = Prefecture.find_by(name: params[:prefecture_name])
    render json: City.where(prefecture_id: prefecture_id).select(:id, :name)
  end
  
  private
  def post_params
    params.require(:post).permit( :title, :explanation, :address, :is_active, :image)
  end
end
