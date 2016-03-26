class CreateChancels < ActiveRecord::Migration
  def change
    create_table :chancels do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.text :chancel_arch_description
      t.string :style
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
