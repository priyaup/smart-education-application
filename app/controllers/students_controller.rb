class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sidebar

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      redirect_to students_path
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
      redirect_to students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to students_path
    end
  end

  def set_sidebar
  @show_sidebar = true
end

  private

  def student_params
    params.require(:student).permit(:first_name, :middle_name, :last_name, :father_name, :class_name, :blood_group, :email, :address, :date_of_birth, :image)
  end

end
