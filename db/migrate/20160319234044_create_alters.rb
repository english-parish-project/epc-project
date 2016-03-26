class CreateAlters < ActiveRecord::Migration
  def change
    create_table :alters do |t|
      t.boolean :medieval_alter
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.text :location
      t.string :style
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
