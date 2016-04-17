class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.string :styles, array: true, default:[]
  
      t.timestamps null: false
      t.belongs_to :church, index: true
    end
  end
end
