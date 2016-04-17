class FabricsController < ApplicationController
  
  def new
    @church = Church.find(params[:church_id])
    @fabric = Fabric.new
    FabricHelper.build_fabric_information(@fabric)
    @date_ranges = FabricHelper.date_ranges
    @styles_collection = FabricHelper.styles_collection
  end
  
  def create
    @church = Church.find(params[:church_id])
    @fabric = @church.create_fabric(fabric_params)
    redirect_to root_path
  end
  
  private 
  
  def fabric_params
    params.require(:fabric).permit(nave_attributes: [:id, :date, :date_secured, :date_information, styles:[]], alter_attributes: [:id, :date, :date_secured, :date_information, :location, :medieval_alter], chancel_attributes: [:id, :date, :date_secured, :date_information, :chancel_arch_description ], styles:[])
  end 
end
