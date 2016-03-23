class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :churches, :date_secured_earliest_extant_fabric, :earliest_extant_fabric_date_secured
  end
end
