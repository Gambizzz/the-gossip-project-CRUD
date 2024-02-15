class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = current_user.id
    @gossip = params[:gossip_id]
    likes = {user_id: @user, gossip_id: @gossip}
    @like = Like.new(likes)

    @like.save!
    if @like.save
      redirect_to basic_pages_home_path
    end
  end

end