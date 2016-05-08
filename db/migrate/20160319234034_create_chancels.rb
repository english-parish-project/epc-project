class CreateChancels < ActiveRecord::Migration
  def change
    create_table :chancels do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.string :styles, array: true, default:[]
      t.text :chancel_arch_description
    
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
