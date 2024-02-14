class CityController < ApplicationController

  def show
    @city = City.find(params[:id])
    @gossips = []
    Gossip.all.each do |gossip|
      if gossip.user.city_id == params[:id].to_i
        @gossips << gossip
      end
    end
  end
end
