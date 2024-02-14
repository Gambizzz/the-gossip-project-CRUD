class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(post_params)
    redirect_to gossip_path(gossip.id)
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
  
end
