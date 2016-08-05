class UserMailer < ApplicationMailer

  def contact_mail(params = nil)
    @greeting = "Hi"

    mail to: "jonathan.sucasaca@gmail.com", subject: "Contáctanos Web"

  end
end
