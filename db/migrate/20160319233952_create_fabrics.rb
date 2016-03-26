class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.string :style
       
      t.timestamps null: false
      t.belongs_to :church, index: true
    end
  end
end
