class TagsController < ApplicationController
	def index
		@tags = Tag.all
		@posts = Post.all
	end
	
	def show
		@tag = Tag.friendly.find(params[:id])
		@posts = Post.tagged_with(@tag.name)
	end
	
	def destroy
		@tag = Tag.friendly.find(params[:id])
		@tag.destroy
		
		redirect_to tags_path
	end
end
