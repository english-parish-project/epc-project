class ChurchesController < ApplicationController
  def index
    @churches = Church.all
  end  
  
  def new
    @date_ranges = ChurchesHelper.date_ranges
    @dioceses_options = ChurchesHelper.dioceses_options
    @county_options = ChurchesHelper.english_county_options
    @volume_options = ChurchesHelper.buildings_of_england_volume_options
    @church = Church.new
  end
  
  def create
    @church = Church.create(church_params)
    redirect_to new_church_fabric_path(@church.id)
  end
  
  def church_params
    params.require(:church).permit(:name, :date_first_mention_in_text, :first_mention_description, :date_earliest_extant_fabric, :date_secured_earliest_extant_fabric, :earliest_extant_fabric_description, :general_narrative, :town, :buildings_of_england_volume, :county, :diocese, :archdeaconry, :latitude, :longitude)
  end
end
