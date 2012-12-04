class UsersController < ApplicationController

	def mensajes
		store_location
		@noleidos = Comment.paginate(:page => params[:page],
		 :per_page => 10).order('created_at DESC').where('leido = ?', false)
		@leidos = Comment.where('leido = ?',true)
	end
end
