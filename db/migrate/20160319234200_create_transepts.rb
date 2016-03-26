class CreateTransepts < ActiveRecord::Migration
  def change
    create_table :transepts do |t|
      t.boolean :south_side
      t.string :south_side_date
      t.boolean :aisled
      t.boolean :north_side
      t.string :north_side_date
      t.boolean :aisled
      t.string :style
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
