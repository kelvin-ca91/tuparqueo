class HomeController < ApplicationController
  def index
    @district = District.all
  end
  
  def about
  end
  
  def contact
    
  end
  
  def account
    if !current_user
      redirect_to root_path
    else
      @parking = Parking.find_by_sql("SELECT * FROM parkings WHERE users_id = #{current_user.id} AND estado!=0 ")
      @favorite = Favorite.find_by_sql("SELECT p.*, f.id as favorite_id FROM parkings p JOIN favorites f ON f.parkings_id = p.id AND p.estado!= 0 AND f.users_id= #{current_user.id}")
      @rentals = Rental.find_by_sql("SELECT p.*, r.id AS rentals_id FROM parkings p LEFT JOIN rentals r ON r.parkings_id = p.id AND r.estado = 1 AND r.users_id = #{current_user.id}")
      @monto = Rental.find_by_sql("SELECT SUM(r.monto) AS monto_total FROM rentals r LEFT JOIN parkings p ON r.parkings_id = p.id AND p.users_id = #{current_user.id}")
      
    end
  end
  
  def mailcontact
    # Send mailer
    UserMailer.contact_mail.deliver()
  end
  
end
