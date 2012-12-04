# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  content    :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  leido      :boolean          default(FALSE)
#

class Comment < ActiveRecord::Base
  attr_accessible :content, :email, :name, :post_id, :leido
  belongs_to :post, :class_name => "Post", :foreign_key => "post_id"
  after_save :enviar_email_creado
  #before_destroy :enviar_email_destruido
  FORMAT_EMAIL = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  validates :content, :email, :name, presence: true
  validates :email, format: {with: FORMAT_EMAIL}


	private
	  def enviar_email_creado
	  	Usermail.delay.comentario_creado(self)#.deliver
	  end

	  def enviar_email_destruido	  	
	  	Usermail.delay.borrar_comentario(name,email,content)#.deliver	  	
	  end
end
