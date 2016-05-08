class CreateTowers < ActiveRecord::Migration
  def change
    create_table :towers do |t|
      t.string :location
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.text :general_notes
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
