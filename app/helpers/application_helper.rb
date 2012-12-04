# encoding: utf-8
module ApplicationHelper
	@@a = 0
	COLORES = ["rojo", "azul", "verde","amarillo_claro"]

	def log_in(user)		
		session[:rakun] = user.email
		current_user = user	
	end

	def loged_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end
	def current_user
		@current_user || User.find_by_email(session[:rakun])
	end

	def log_out
		self.current_user = nil
		session[:rakun] = nil
	end

	def loguear_user
		unless loged_in?
			store_location
			redirect_to entrar_path
		end
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def donde_ir(post)
		if loged_in?
			mensajes_path
		else
			post_title_path(post.title)
		end
	end
	
	def siguiente(letra, cycle)
		if cycle == "pull-left"			
			"« #{letra.title}"		
		else			
			"#{letra.title} »"
		end		
	end

	def colores
		a = COLORES.first
		COLORES.delete(a)
		COLORES.push(a)
		a
	end
end
