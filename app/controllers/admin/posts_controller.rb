class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if admin_signed_in?
      if params[:post].nil?
        flash[:alert] = '「この投稿を削除する」ボタンを押してから削除してください'
        return redirect_to edit_admin_post_path(@post.id)
      else
        @post.update(post_params)
        redirect_to admin_homes_top_path
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:is_active)
  end

end
