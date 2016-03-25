class RenameDateEarliestSecured < ActiveRecord::Migration
  def change
    rename_column :churches, :earliest_extant_fabric_date_secured, :date_earliest_extant_fabric_secured
  end
end
