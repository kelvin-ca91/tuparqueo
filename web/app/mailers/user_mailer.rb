class UserMailer < ApplicationMailer

  def contact_mail(params = nil)
    @greeting = "Hi"

    mail to: "kelvin.ca91@gmail.com", subject: 'Contáctanos Web'
  end
end
