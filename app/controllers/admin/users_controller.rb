class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def unsubscribe
    @user = User.find(params[:id])
    @user.update(is_active: true)
    flash[:notice] = "退会しました。"
    redirect_to admin_homes_top_path
  end


  private
  def user_params
    params.require(:user).permit(:is_active)
  end
end
