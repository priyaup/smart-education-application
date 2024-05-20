class Admin::BlogsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_sidebar
  before_action :authorize_admin

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to admin_blogs_path
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to admin_blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to admin_blogs_path
    end
  end

  def set_sidebar
    @show_sidebar = true
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :description)
  end

end
def authorize_admin
  unless current_user.admin?
    flash[:alert] = "You are not authorized to view this page."
    redirect_to root_path
  end
end