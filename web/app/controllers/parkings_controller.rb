class ParkingsController < ApplicationController
    def index
        @district = District.all
        # @parking = Parking.find_by(districts_id: params[:distrito])
        if params[:distrito].empty? == false && params[:distrito] !='0'
            #@parking = Parking.find_by_sql("SELECT p.*, f.id as favorite_id FROM parkings p LEFT JOIN favorites f ON f.parkings_id = p.id WHERE p.estado = 1 AND p.direccion LIKE '%#{params[:direccion]}%' AND p.districts_id = #{params[:distrito]}")
            @parking = Parking.find_by_sql("SELECT p.*, f.id as favorite_id, u.nombre as usuario_name FROM parkings p LEFT JOIN favorites f ON f.parkings_id = p.id AND f.users_id = #{current_user.id} LEFT JOIN rentals r ON r.parkings_id = p.id LEFT JOIN users u ON u.id=p.users_id WHERE (p.estado = 1 OR p.estado = 2)  AND p.direccion LIKE '%#{params[:direccion]}%' AND p.districts_id = #{params[:distrito]} AND (r.fecha_fin IS NULL OR r.fecha_fin < '#{params[:fecha_inicio]}' )")
            @district_search = District.find_by(id: params[:distrito])
        else
            #@parking = Parking.find_by_sql("SELECT p.*, f.id as favorite_id FROM parkings p LEFT JOIN favorites f ON f.parkings_id = p.id WHERE p.estado = 1 AND p.direccion LIKE '%#{params[:direccion]}%'")
            @parking = Parking.find_by_sql("SELECT p.*, f.id as favorite_id, u.nombre as usuario_name FROM parkings p LEFT JOIN favorites f ON f.parkings_id = p.id AND f.users_id = #{current_user.id} LEFT JOIN rentals r ON r.parkings_id = p.id LEFT JOIN users u ON u.id=p.users_id WHERE (p.estado = 1 OR p.estado = 2) AND p.direccion LIKE '%#{params[:direccion]}%'  AND (r.fecha_fin IS NULL OR r.fecha_fin < '#{params[:fecha_inicio]}')")
            @district_search = District.first
        end
    end
    #select p.*, f.id as favorite_id, r.fecha_inicio, r.fecha_fin FROM parkings p LEFT JOIN favorites f ON f.parkings_id = p.id LEFT JOIN rentals r ON r.parkings_id = p.id  WHERE p.estado = 1 AND ( r.fecha_fin < '2016-08-28' OR r.fecha_fin IS NULL)
    def disabled 
        parking = Parking.find_by(id: params[:id])
        if parking.estado == 1
            parking.update(estado: 3)
        elsif parking.estado == 3
            parking.update(estado: 1)
        end
    end
    
    def show
        @parking = Parking.find(params[:id])
        @rental = Rental.new
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
        params.require(:parking).permit(:titulo, :descripcion, :costo_dia, :costo_mes, :costo_anho, :latitud, :longitud, :direccion, :districts_id, :terminos_condiciones, :image, :file_name,:image_file_name)
    end
    
end
