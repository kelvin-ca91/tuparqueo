class HomeController < ApplicationController
  def index
  end
  
  def about
  end
  
  def contact
    
  end
  
  def account
    if !current_user
      redirect_to root_path
    else
      @parking = Parking.find_by_sql("SELECT * FROM parkings WHERE users_id = #{current_user.id} AND estado = 1")
      @favorite = Favorite.find_by_sql("SELECT p.*, f.id as favorite_id FROM parkings p JOIN favorites f ON f.parkings_id = p.id AND p.estado = 1 AND f.users_id= #{current_user.id}")
    end
  end
  
  def mailcontact
    # Send mailer
    UserMailer.contact_mail.deliver()
  end
  
end
