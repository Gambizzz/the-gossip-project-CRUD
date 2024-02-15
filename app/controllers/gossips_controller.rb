class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :create, :update]
  
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Gossip.find(params[:id]).comments
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(post_params)
    @gossip.update(user: current_user)
 

    redirect_to gossip_path(@gossip.id)
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      redirect_to basic_pages_home_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to basic_pages_home_path
  end

  private
  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end

  private
  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end

  
end
