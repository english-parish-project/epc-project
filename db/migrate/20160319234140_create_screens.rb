class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.text :description
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
