class Contact < ActiveRecord::Base
  attr_accessible :email, :msg, :name
  after_save :enviarme_mensage
  FORMAT_EMAIL = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :email, :msg, :name, presence: true
  validates :email, format: {with: FORMAT_EMAIL}
	def enviarme_mensage
		Contactmail.delay.enviar_email(self)		
	end
end
