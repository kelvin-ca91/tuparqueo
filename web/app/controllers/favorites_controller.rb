class FavoritesController < ApplicationController
  def index
  end

  def create
    @favorite = Favorite.new({users_id: params[:userId], parkings_id: params[:parkingId]})
    @favorite.save
  end

  def destroy
    Favorite.find(params[:id]).destroy
  end
end
