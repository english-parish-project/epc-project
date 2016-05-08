class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.text :location
      t.boolean :original
      t.text :description
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
