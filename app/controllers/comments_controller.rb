class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :create, :update]
  
  def new
    @gossip = Gossip.find(params[:gossip_id]) 
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    user = User.all.sample
    @comment = Comment.create(content: params[:content], gossip: @gossip, user: user)
    redirect_to gossip_path(@gossip)
  end 

  def edit 
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
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

  def comment
    @comment = Comment.find(params[:id])
  end

  def gossip_id
    @gossip = Gossip.find(params[:gossip_id])
  end
end
