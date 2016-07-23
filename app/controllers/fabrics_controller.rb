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
    params.require(:fabric).permit(nave_attributes: [:id, :date, :date_secured, :date_evidence, :notes, styles:[]], chantry_chapels_attributes:[:id, :date, :date_secured, :date_evidence, :location, :funding_information, :notes, styles:[]], altar_attributes: [:id, :date, :date_secured, :date_evidence, :location, :medieval_altar, :location_in_chancel], towers_attributes: [:id, :location, :date, :date_secured, :date_evidence, :notes], chancel_attributes: [:id, :date, :date_secured, :date_evidence, :notes, styles:[]], styles:[])
  end 
end
