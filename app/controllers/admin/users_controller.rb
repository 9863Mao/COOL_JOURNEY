class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if admin_signed_in?
      @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:is_active)
  end
end
