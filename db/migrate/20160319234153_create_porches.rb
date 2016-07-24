class CreatePorches < ActiveRecord::Migration
  def change
    create_table :porches do |t|
      t.text :location
      t.string :date
      t.boolean :date_secured
      t.text :date_evidence
      t.boolean :vaulting
      t.text :vaulting_type
      t.text :notes
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
