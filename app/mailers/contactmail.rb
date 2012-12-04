class Contactmail < ActionMailer::Base
  default from: "Rakun"

  def enviar_email(contact)
  	@contact = contact
  	mail to: @contact.email, :subject => "Te dejaron un mensage en el blog!"
  end
end
