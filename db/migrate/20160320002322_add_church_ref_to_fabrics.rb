class AddChurchRefToFabrics < ActiveRecord::Migration
  def change
    add_reference :fabrics, :church, index: true, foreign_key: true
  end
end
