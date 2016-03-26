class CreatePiscinas < ActiveRecord::Migration
  def change
    create_table :piscinas do |t|
      t.string :date
      t.boolean :date_secured
      t.text :comments
      t.string :style
       
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
