class SectionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sections = Sections.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new

  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    section = Section.find(params[:id])
    if section.update_attributes(section_params)
      redirect_to sections_path, flash: {success: 'Section successfully updated'}
    else
      redirect_to edit_section_path(params[:id]), alert: 'An error occurred. Please try again'
    end
  end

  def destroy
    section = Section.find(params[:id])
    if section.destroy
      flash[:success] = 'Section successfully deleted'
    else
      flash[:alert] = 'An error occurred. Please try again'
    end
    redirect_to sections_path
  end

  private
    def section_params
      params.require(:section).permit(:section_name, :image)
    end
end
