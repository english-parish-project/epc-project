class CreatePorches < ActiveRecord::Migration
  def change
    create_table :porches do |t|
      t.text :location
      t.string :date
      t.boolean :valuting
      t.string :valuting_type
      t.text :comments
      t.string :style
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
