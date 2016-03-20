class CreateTowers < ActiveRecord::Migration
  def change
    create_table :towers do |t|
      t.string :date
      t.boolean :date_secured
      t.string :location
      t.text :comments
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
