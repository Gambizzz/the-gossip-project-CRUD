class CommentsController < ApplicationController
  def new
    @gossip = Gossip.find(params[:gossip_id]) 
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    user = User.all.sample
    @comment = Comment.new(content: params[:content], gossip: @gossip, user: user)
    if @comment.save
      redirect_to gossip_path(@gossip.id)
    else
      render gossip_path(@gossip.id)
    end
  end 

  def edit 
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    
    if @comment.update!(content: params[:content])  
      redirect_to gossip_path(@gossip.id)
    else
      render :edit
    end
  end

  def destroy 
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip.id)
  end
end
