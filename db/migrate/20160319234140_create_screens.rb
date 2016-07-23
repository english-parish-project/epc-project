class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_evidence
      t.text :description
      t.text :notes
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
