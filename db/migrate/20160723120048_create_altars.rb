class CreateAltars < ActiveRecord::Migration
  def change
    create_table :altars do |t|
      t.boolean :medieval_altar
      t.string :date
      t.boolean :date_secured
      t.text :date_evidence
      t.text :location_in_chancel
      t.text :notes
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
