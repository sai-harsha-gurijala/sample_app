class LikesController < ApplicationController
  
  
  def destroy
    @id = current_user.likes.where(micropost_id: params[:share_id]).ids
    @like = current_user.likes.find_by(id: @id).destroy
    flash[:success] = "You have Unliked the Micropost"
    redirect_to root_url
  end

 
  def create
    @like = current_user.likes.create(micropost_id: params[:share_id])
    if @like.save 
      flash[:success] = "You have Liked the Micropost"
    end
    
    redirect_to root_url
  end

end
