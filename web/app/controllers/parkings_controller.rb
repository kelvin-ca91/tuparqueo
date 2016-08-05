class ParkingsController < ApplicationController
    def index
        @parking = Parking.all        
    end
    
    def show
        @parking = Parking.find(params[:id])
    end
    
    def new
        @parking = Parking.new
        render '_form_parking'
    end
    
    def edit
        @parking = Parking.find(params[:id])
        render '_form_parking'
    end
    
    def update
        @parking = Parking.find(params[:id])
        if @parking.update_attributes(parking_params)
            redirect_to home_account_path
        else
            render action: 'edit'
        end
        
    end
    
    def destroy
        Parking.find(params[:id]).destroy
    end
    
    def create
        @parking = Parking.new(parking_params)
        if @parking.save
            redirect_to home_account_path
        else
            render action: 'new'
        end
    end
    
    private
    def parking_params
        params.require(:parking).permit(:titulo, :descripcion, :costo_dia, :costo_mes, :costo_anho)
    end
    
end