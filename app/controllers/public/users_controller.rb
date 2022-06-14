class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    #@posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました！"
      redirect_to public_user_path(current_user)
    else
      render :edit
    end
  end
  
  def unsubscribe
    @user = current_user
    
    @user.update(is_active: true)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end
  
  def home
    if user_signed_in?
      @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
    end
    @posts_new = Post.all.order(created_at: :desc).limit(10)
  end
  
  
  

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :self_introduction, :user_nickname, :is_active, :body, :profile_image)
  end
end
