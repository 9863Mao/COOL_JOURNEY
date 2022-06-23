class Public::SearchesController < ApplicationController
  def searches_result
    @range = params[:range]
    #binding.pry
    
    if @range == "ユーザー"
      @users = User.active_data.looks(params[:search], params[:word])
      @users_page = @users.page(params[:page])
      #binding.pry
    else
      @posts = Post.active_data.looks(params[:search], params[:word])
      @posts_page = @posts.page(params[:page])
    end
  end
end
