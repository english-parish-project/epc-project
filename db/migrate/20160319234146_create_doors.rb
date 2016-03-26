class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.text :location
      t.boolean :original
      t.text :comments
      t.string :style
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
