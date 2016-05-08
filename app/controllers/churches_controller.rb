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
  
  def show
    @church = Church.find(params[:id])
  end
  
  def church_params
    params.require(:church).permit(:name, :first_mentioned_in_text, :first_mentioned_in_text_information, :earliest_extant_fabric_date, :earliest_extant_fabric_date_secured, :earliest_extant_fabric_date_information, :earliest_extant_fabric_location, :general_notes, :town, :buildings_of_england_volume, :county, :diocese, :archdeaconry, :latitude, :longitude, :minster_status, :minster_current_status, :collegiate_status, :collegiate_date)
  end
end
