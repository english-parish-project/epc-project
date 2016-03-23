class FabricsController < ApplicationController
  
  def new
    @church = Church.find(params[:church_id])
    @fabric = Fabric.new
    @fabric.build_nave
    @date_ranges = FabricHelper.date_ranges
  end
  
  def create
    @church = Church.find(params[:church_id])
    @fabric = @church.create_fabric(fabric_params)
    redirect_to root_path
  end
  
  private 
  
  def fabric_params
    params.require(:fabric).permit(nave_attributes: [:id, :date, :date_secured, :date_information])
  end 
end
