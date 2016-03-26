class FabricsController < ApplicationController
  
  def new
    @church = Church.find(params[:church_id])
    @fabric = Fabric.new
    @fabric.build_nave
    @fabric.build_chancel
    @fabric.build_alter
    @date_ranges = FabricHelper.date_ranges
  end
  
  def create
    @church = Church.find(params[:church_id])
    @fabric = @church.create_fabric(fabric_params)
    redirect_to root_path
  end
  
  private 
  
  def fabric_params
    params.require(:fabric).permit(nave_attributes: [:id, :date, :date_secured, :date_information], alter_attributes: [:id, :date, :date_secured, :date_information, :location, :medieval_alter], chancel_attributes: [:id, :id, :date, :date_secured, :date_information, :chancel_arch_description ])
  end 
end
