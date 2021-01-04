class UsersController < ApplicationController


  def show
      @user = User.find(params[:id])
      #@messages = @room.messages.includes(:user)
    
      # if post.checked 
      #   post.update(checked: false)
      # else
      #   post.update(checked: true)
      # end
  
      # item = Post.find(params[:id])
      # render json: { post: item }
    
  
  end



end
