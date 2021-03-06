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
    altars_attributes: 
    [:id, :date, :date_secured, :date_evidence, :medieval_altar, :location_in_chancel, :notes], 
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
    piscina_attributes: 
    [:id, :date, :date_secured, :date_evidence, :location, :notes],  
    font_attributes: 
    [:id, :date, :date_secured, :date_evidence, :location, :notes],  
    screen_attributes: 
    [:id, :date, :date_secured, :date_evidence, :notes],
    transept_attributes: 
    [:id, :south_side, :south_side_date, :south_side_date_secured, :south_side_date_evidence, :south_side_aisled, :south_side_notes, :north_side, :north_side_date, :north_side_date_secured, :north_side_date_evidence, :north_side_aisled, :north_side_notes], 
    lady_chapel_attributes: 
    [:id, :location, :date, :date_secured, :date_evidence, :notes, styles:[]],
    styles:[])
  end 
end
