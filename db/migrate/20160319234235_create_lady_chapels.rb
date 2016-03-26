class CreateLadyChapels < ActiveRecord::Migration
  def change
    create_table :lady_chapels do |t|
      t.string :date
      t.boolean :date_secured
      t.text :date_information
      t.string :location
      t.text :comments
      t.string :style
      
      t.belongs_to :fabric, index: true
      t.timestamps null: false
    end
  end
end
