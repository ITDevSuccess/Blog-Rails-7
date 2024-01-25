class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  # ou
  # before_action :set_blog_post, except: [:index, :new, :create]


  def index
    @blog_posts = BlogPost.all
  end

  def show
    # @blog_post = BlogPost.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new
    end
  end

  def edit
    # @blog_post = BlogPost.find(params[:id])
  end

  def update
    # @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @blog_post = BlogPost.find(params[:id])
    if @blog_post.destroy
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:blog_post).permit('title', 'body')
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
end