class Usermail < ActionMailer::Base
  default from: "Rakun Borrando comments!"

  def borrar_comentario(name, email, content)
  	@name = name
  	@email = email
  	@content = content  	
  	mail to: @email, :subject => "Comentario Borrado!"
  end

  def comentario_creado(comment)
  	@comment = comment
  	mail to: "rakatongo@gmail.com", :subject => "Tienes un nuevo comentario en tu blog"
  end
end
