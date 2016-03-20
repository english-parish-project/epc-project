class CreateChancels < ActiveRecord::Migration
  def change
    create_table :chancels do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.string :chancel_arch_describtion
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
