class FavoritesController < ApplicationController
  def index
  end

  def create
    @favorite = Favorite.new({users_id: params[:userId], parkings_id: params[:parkingId]})
    @favorite.save
  end

  def destroy
    if params[:id]
      Favorite.find(params[:id]).destroy
    else
      favorite = Favorite.where(users_id: params[:userId], parkings_id: params[:parkingId])
      Favorite.find(favorite[0].id).destroy
    end
  end
end
