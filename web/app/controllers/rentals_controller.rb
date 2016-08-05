class RentalsController < ApplicationController
    def index
    end
    
    def show
    end
    
    def new
    end
    
    
    def create
        @rentals = Rental.new(users_id: current_user.id, parkings_id: params[:parkings_id], estado: 1 )
        @rentals.save
    end
    
    
    
end
