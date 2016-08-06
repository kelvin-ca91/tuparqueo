class RentalsController < ApplicationController
    def index
    end
    
    def show
    end
    
    def new
    end
    
    
    def create
        fechaInicio = params[:fechaInicio].split('-')
        fechaFin = params[:fechaFin].split('/')
        
        rentals = Rental.new(
            users_id: current_user.id, 
            parkings_id: params[:parkings_id], 
            fecha_inicio:  fechaInicio[2]+'-'+fechaInicio[0]+'-'+fechaInicio[1] , 
            fecha_fin: fechaFin[2]+'-'+fechaFin[0]+'-'+fechaFin[1] ,
            monto: params[:montoTotal],
            cant_tiempo: params[:cantDias],
            tiempo: params[:tiempo],
            estado: 1 )
            
        if rentals.save
            parkings = Parking.find_by(id: params[:parkings_id])
            parkings.update(estado: 2)
        end     
    end
    
    def destroy
        rentals = Rentals.find_by(id: params[:id])
        rentals.update(estado: 0)
        
        parkings = Parking.find_by(id: rentals.parkings_id)
        parkings.update(estado:1)
    end
    
    
    
end
