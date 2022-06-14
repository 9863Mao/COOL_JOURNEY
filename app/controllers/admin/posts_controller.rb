class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if admin_signed_in?
    @post.update(post_params)
    redirect_to admin_homes_top_path
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:is_active)
  end
  
end
