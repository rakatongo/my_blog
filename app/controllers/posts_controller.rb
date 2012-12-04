class PostsController < ApplicationController
	before_filter :loguear_user, except:[:index, :show]
	
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
		respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @products }
	    end
	end

	def new
		@post = Post.new
	end

	def create		
		@post = current_user.posts.create(params[:post])
		if @post && @post.save
			flash[:notice] = "Post creado"
			redirect_to post_title_path(@post.title)
		else			
			render 'new'			
		end
	end

	def show		
		@post = Post.find_by_title(params[:title])				
		if @post
			@otros = Post.otros(@post)
			@comment = @post.comments.build
			render 'show'		
		else
			flash[:error] = "Post no encontrado"
			redirect_to root_path
		end		
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			flash[:notice] = "Post Updateado correctamente."
			redirect_to post_title_path(@post.title)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path, notice: "Post borrado."
	end
end
