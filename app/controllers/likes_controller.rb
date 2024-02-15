class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    gossip = Gossip.find(params[:gossip_id])
    like = Like.create(user_id: current_user, gossip_id: params[:gossip_id])
    if like.save
      redirect_to basic_pages_home_path
    end
  end

end