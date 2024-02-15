class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :create, :update]
  
  def new
    @gossip = Gossip.find(params[:gossip_id]) 
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    
    @comment = Comment.new(content: params[:content], gossip: @gossip, user: current_user)
    if @comment.save
      redirect_to gossip_path(@gossip.id)
    else
      render gossip_path(@gossip.id)
    end
  end 

  def edit 
    @comment = Comment.find_by(params[:comment_id])
  end

  def update
    @comment = Comment.find(params[:comment_id])
    if @comment.update(content: params[:content])
      redirect_to basic_pages_home_path
    else
      render :edit
    end
  end

  def destroy 
    @comment = Comment.find(params[:id])
    Comment.delete(@comment)
    return redirect_to basic_pages_home_path
  end

  private
  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end
end
