class RentalsController < ApplicationController
    skip_before_filter :verify_authenticity_token 
    def index
    end
    
    def show
    end
    
    def new
    end
    
    
    def create
        
        # Amount in cents
        #@amount = 500
        
        #  customer = Stripe::Customer.create(
        #    :email => params[:stripeEmail],
        #    :source  => params[:stripeToken]
        #  )
        
        #  charge = Stripe::Charge.create(
        #    :customer    => customer.id,
        #    :amount      => @amount,
        #    :description => 'Rails Stripe customer',
        #    :currency    => 'usd'
        #  )
        
        #rescue Stripe::CardError => e
        #  flash[:error] = e.message
        #  redirect_to new_charge_path
        
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
        rentals = Rental.find_by(id: params[:id])
        rentals.update(estado: 0)
        
        parkings = Parking.find_by(id: rentals.parkings_id)
        parkings.update(estado:1)
    end
    
    
    
end
