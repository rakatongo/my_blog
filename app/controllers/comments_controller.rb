class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment])		
		if @post && @comment.save			
			redirect_to post_title_path(@post.title), notice: "Comentario creado"			
		else
			flash[:error] = "Comentario Invalido"
			redirect_to post_title_path(@post.title)		
		end			
	end

	def destroy		
		post = Post.find(params[:post_id])
		comment = post.comments.find(params[:id])		
		comment.destroy
		@id = params[:id]
		respond_to do |wants|
			wants.js
		end		
	end

	def leido		
		@comment = Comment.find(params[:id])
		respond_to do |wants|
			if @comment.update_attributes(leido: true)					
				wants.js 			
			else
				render mensajes_path
			end
		end
		
	end
end
