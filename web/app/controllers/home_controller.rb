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
      @usuario = User.find(1)
      @parking = Parking.all
    end
  end
  
  def mailcontact
    # Send mailer
    UserMailer.contact_mail.deliver()
  end
  
end
