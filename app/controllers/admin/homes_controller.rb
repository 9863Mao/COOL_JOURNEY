class Admin::HomesController < ApplicationController
  def top
    if admin_signed_in?
      @posts = Post.all.order(created_at: :desc)
      @users = User.all.order(created_at: :desc)
    end
  end
end
