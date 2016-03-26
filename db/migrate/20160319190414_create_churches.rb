class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.text :name
      t.string :date_first_mention_in_text
      t.text :first_mention_description
      t.string :date_earliest_extant_fabric
      t.boolean :date_earliest_extant_fabric_secured
      t.string :location_of_earliest_extant_fabric
      t.text :earliest_extant_fabric_description
      t.string :town
      t.string :buildings_of_england_volume
      t.string :county
      t.string :diocese
      t.string :archdeaconry
      t.float :latitude
      t.float :longitude
      t.text :general_narrative

      t.timestamps null: false
    end
  end
end
