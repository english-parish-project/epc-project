class CreateTransepts < ActiveRecord::Migration
  def change
    create_table :transepts do |t|
      t.boolean :south_side
      t.string :south_side_date
      t.boolean :south_side_date_secured
      t.string :south_side_date_evidence
      t.boolean :south_side_aisled
      t.string :south_side_notes      
      t.boolean :north_side
      t.string :north_side_date
      t.boolean :north_side_date_secured
      t.string :north_side_date_evidence
      t.boolean :north_side_aisled
      t.string :north_side_notes
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
