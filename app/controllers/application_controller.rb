class ApplicationController < ActionController::Base
	before_filter :ultimo, :mensajes_nuevos, :contact_builder
  protect_from_forgery
  include ApplicationHelper

  def mensajes_nuevos
  	@noleidos = Comment.where('leido = ?',false)
  end
  def ultimo  	
  	@ultimos = Post.ultimos_post
  end

  def contact_builder
  	@contact = Contact.new
  end
end
