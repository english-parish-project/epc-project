class FabricsController < ApplicationController
  
  def new
    @church = Church.find(params[:church_id])
    @fabric = Fabric.new
    FabricHelper.build_fabric_information(@fabric)
    @date_ranges = FabricHelper.date_ranges
  end
  
  def create
    @church = Church.find(params[:church_id])
    @fabric = @church.build_fabric(fabric_params)
    if @fabric.save
      redirect_to root_path
    else 
      render 'new'
    end
  end
  
  private 
  
  def fabric_params
    params.require(:fabric).permit(nave_attributes: [:id, :date, :date_secured, :date_information, styles:[]], alter_attributes: [:id, :date, :date_secured, :date_information, :location, :medieval_alter], chancel_attributes: [:id, :date, :date_secured, :date_information, :chancel_arch_description ], styles:[])
  end 
end
