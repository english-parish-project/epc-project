class CreateTowers < ActiveRecord::Migration
  def change
    create_table :towers do |t|
      t.string :location
      t.string :date
      t.boolean :date_secured
      t.text :date_evidence
      t.text :notes
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
