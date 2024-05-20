class Admin::StudentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_sidebar
  before_action :authorize_admin


  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      flash[:notice] = "Student has been created"
      redirect_to admin_students_path
    else
     flash[:notice] = "Something went wrong."
     redirect_to admin_students_path
   end
 end

 def show
  @student = Student.find(params[:id])
end

def edit
  @student = Student.find(params[:id])
end

def update
  @student = Student.find(params[:id])
  if @student.update(student_params)
    flash[:notice] = "Student has been updated"
    redirect_to admin_students_path
  else
    flash[:notice] = "Something went wrong."
    render :edit
  end
end

def destroy
  @student = Student.find(params[:id])

  # Handle deletion logic in the application
  ActiveRecord::Base.transaction do
    @student.syllabuses.destroy_all # Delete associated syllabuses
    @student.destroy # Delete the student record
  end

  redirect_to admin_students_path
end


def set_sidebar
  @show_sidebar = true
end

private

def student_params
  params.require(:student).permit(:first_name, :middle_name, :last_name, :father_name, :class_name, :blood_group, :email, :address, :date_of_birth, :image)
end

def authorize_admin
  unless current_user.admin?
    flash[:alert] = "You are not authorized to view this page."
    redirect_to root_path
  end
end

end
