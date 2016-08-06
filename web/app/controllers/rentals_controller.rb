class RentalsController < ApplicationController
    def index
    end
    
    def show
    end
    
    def new
    end
    
    
    def create
        rentals = Rental.new(users_id: current_user.id, parkings_id: params[:parkings_id], estado: 1 )
        if rentals.save
            parkings = Parking.find_by(id: params[:parkings_id])
            parkings.update(estado: 2)
        end
            
    end
    
    
    
end
