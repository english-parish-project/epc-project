class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.text :location
      t.string :date
      t.boolean :date_secured
      t.text :date_evidence
      t.text :notes
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
