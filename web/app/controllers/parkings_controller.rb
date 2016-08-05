class ParkingsController < ApplicationController
    def index
        @parking = Parking.find_by_sql("SELECT p.*, f.id as favorite_id FROM parkings p LEFT JOIN favorites f ON f.parkings_id = p.id WHERE p.estado = 1 ")
    end
    # 
    
    def show
        @parking = Parking.find(params[:id])
    end
    
    def new
        @parking = Parking.new
        @district = District.all
        render '_form_parking', layout: 'blank'
    end
    
    def edit
        @parking = Parking.find(params[:id])
        @district = District.all
        render '_form_parking', layout: 'blank'
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
        parking = Parking.find_by(id: params[:id])
        parking.update(estado: 0)
        # Parking.find(params[:id]).destroy
    end
    
    def create
        @parking = Parking.new(parking_params)
        @parking.users_id = current_user.id
        @parking.estado = 1
        if @parking.save
            redirect_to home_account_path
        else
            render action: 'new'
        end
    end
    
    private
    def parking_params
        params.require(:parking).permit(:titulo, :descripcion, :costo_dia, :costo_mes, :costo_anho, :latitud, :longitud, :direccion, :districts_id )
    end
    
end
