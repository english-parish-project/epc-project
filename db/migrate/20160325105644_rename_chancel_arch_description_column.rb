class RenameChancelArchDescriptionColumn < ActiveRecord::Migration
  def change
    rename_column :chancels, :chancel_arch_describtion, :chancel_arch_description
    change_column :chancels, :chancel_arch_description, :text
  end
end
