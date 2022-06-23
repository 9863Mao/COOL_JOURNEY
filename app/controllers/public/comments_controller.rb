class Public::CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
 
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to public_post_path(params[:post_id])
  end

  private
  def comment_params
    params.permit(:comment_content, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
