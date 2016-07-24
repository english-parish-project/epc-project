class FabricsController < ApplicationController
  
  def edit_part1
    @fabric = Fabric.find(params[:id])
    FabricHelper.build_information_part1(@fabric)
    @date_ranges = FabricHelper.date_ranges
    render 'fabrics/form_part1'  
  end
  
  def edit_part2
    @fabric = Fabric.find(params[:id])
    FabricHelper.build_information_part2(@fabric)
    @date_ranges = FabricHelper.date_ranges
    render 'fabrics/form_part2'
  end

  def update
    @fabric = Fabric.find(params[:id])
    @fabric.update(fabric_params)
    if request.fullpath == fabric_form_part1_path(@fabric)
      redirect_to fabric_form_part2_path(params[:id])
    else  
      redirect_to root_path
    end
  end
  
  
  private 
  
  def fabric_params
    params.require(:fabric).permit(
    nave_attributes: 
    [:id, :date, :date_secured, :date_evidence, :notes, styles:[]], 
    chantry_chapels_attributes:
    [:id, :date, :date_secured, :date_evidence, :location, :funding_information, :notes, styles:[]], 
    altar_attributes: 
    [:id, :date, :date_secured, :date_evidence, :location, :medieval_altar, :location_in_chancel, :notes], 
    towers_attributes: 
    [:id, :location, :date, :date_secured, :date_evidence, :notes],
    chancel_attributes: 
    [:id, :date, :date_secured, :date_evidence, :notes, styles:[]],
    doors_attributes: 
    [:id, :location, :original, :notes],
    porch_attributes: 
    [:id, :date, :date_secured, :date_evidence, :location, :vaulting, :vaulting_type, :notes],
    sedilia_attributes: 
    [:id, :date, :date_secured, :date_evidence, :notes, styles:[]],  
    styles:[])
  end 
end
