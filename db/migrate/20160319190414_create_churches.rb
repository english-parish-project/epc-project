class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.string :town
      t.string :county
      t.string :buildings_of_england_volume
      t.string :diocese
      t.string :archdeaconry
      t.float :latitude
      t.float :longitude
      t.boolean :minster_status
      t.boolean :minster_current_status
      t.boolean :collegiate_status
      t.integer :collegiate_date
      t.integer :first_mentioned_in_text
      t.text :first_mentioned_in_text_information
      t.string :earliest_extant_fabric_date
      t.text :earliest_extant_fabric_date_information
      t.boolean :earliest_extant_fabric_date_secured
      t.text :earliest_extant_fabric_location
      t.text :general_notes

      t.timestamps null: false
    end
  end
end
