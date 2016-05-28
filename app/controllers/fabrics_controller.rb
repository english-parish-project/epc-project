class FabricsController < ApplicationController
  
  def edit
    @fabric = Fabric.find(params[:id])
    FabricHelper.build_fabric_information(@fabric)
    @date_ranges = FabricHelper.date_ranges
  end

  def update
    @fabric = Fabric.find(params[:id])
    @fabric.update(fabric_params)
    redirect_to root_path
  end
  
  private 
  
  def fabric_params
    params.require(:fabric).permit(nave_attributes: [:id, :date, :date_secured, :date_information, :general_notes, styles:[]], alter_attributes: [:id, :date, :date_secured, :date_information, :location, :medieval_alter, :location_in_chancel], towers_attributes: [:id, :location, :date, :date_secured, :date_information, :general_notes], chancel_attributes: [:id, :date, :date_secured, :date_information, :chancel_arch_description, styles:[]], styles:[])
  end 
end
