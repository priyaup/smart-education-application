class SyllabusesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_sidebar


  def index
    @syllabuses = Syllabus.all
  end

  def new
    @syllabus = Syllabus.new
  end

  def create
    @syllabus = Syllabus.new(syllabus_params)
    if @syllabus.save
      redirect_to syllabuses_path
    else
      render :new
    end
  end

  def show
    @syllabus = Syllabus.find(params[:id])
  end

  def edit
    @syllabus = Syllabus.find(params[:id])
  end

  def update
    @syllabus = Syllabus.find(params[:id])
    if @syllabus.update(syllabus_params)
      redirect_to syllabuses_path
    else
      render :edit
    end
  end

  def destroy
    @syllabus = Syllabus.find(params[:id])
    if @syllabus.destroy
      redirect_to syllabuses_path
    end   
  end

  

  def set_sidebar
    @show_sidebar = true
  end

  private

  def syllabus_params
    params.require(:syllabus).permit(:title, :description, :student_id)
  end

  

end
