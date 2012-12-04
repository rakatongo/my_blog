class ContactsController < ApplicationController

	def create
		@contact = Contact.create(params[:contact])
		if @contact.save
			flash[:success] = "Message sent..."
			redirect_to root_path
		else
			flash[:error] = "Message failed"
			redirect_to root_path
		end
	end
end
