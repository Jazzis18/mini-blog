class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
  	@posts = Post.all
  	@tags = Post.tag_counts_on(:tags)
  end

  def new
  	@post = Post.new
  end
  
  def create
  	@post = current_user.posts.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end
  
  def update
  	if @post.update_attributes(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end
  
  def destroy
  	@post.destroy
  	redirect_to posts_path
  end
  
  private
  
  def find_post
    @post = Post.friendly.find(params[:id])
  end
  
  def post_params
  	params.require(:post).permit(:title, :content, :tag_list, :slug)
  end
end
