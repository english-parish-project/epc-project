class CreateChantryChapels < ActiveRecord::Migration
  def change
    create_table :chantry_chapels do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.string :location
      t.string :funded_by
      t.text :comments
      t.string :style
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
