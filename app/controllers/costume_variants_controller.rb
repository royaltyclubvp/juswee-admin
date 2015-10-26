class CostumeVariantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @costume_variants = CostumeVariant.all
  end

  def show
    @costume_variant = CostumeVariant.find(params[:id])
  end

  def edit
    @costume_variant = CostumeVariant.find(params[:id])
  end

  def new

  end

  def update
    costume_variant = CostumeVariant.find(params[:id])
    if costume_variant.update_attributes(costume_variant_params)
      redirect_to section_costume_costume_variants_path(params[:section_id], params[:costume_id]), flash: {success: 'Costume variant successfully updated'}
    else
      redirect_to edit_section_costume_costume_variant_path(params[:section_id], params[:costume_id]), alert: 'An error occurred. Please try again'
    end
  end
end
