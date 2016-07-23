class Fabric < ActiveRecord::Base
  has_one :nave
  accepts_nested_attributes_for :nave, reject_if: :all_blank
  
  has_one :chancel
  accepts_nested_attributes_for :chancel, reject_if: :all_blank
  
  has_one :altar
  accepts_nested_attributes_for :altar, reject_if: :all_blank
  
  has_one :sedilia
  accepts_nested_attributes_for :sedilia
  
  has_one :piscina
  accepts_nested_attributes_for :piscina
  
  has_one :screen
  accepts_nested_attributes_for :screen
  
  has_many :doors
  accepts_nested_attributes_for :doors
  
  has_one :porch
  accepts_nested_attributes_for :porch
  
  has_one :transept
  accepts_nested_attributes_for :transept
  
  has_many :chantry_chapels
  accepts_nested_attributes_for :chantry_chapels
  
  has_one :lady_chapel
  accepts_nested_attributes_for :lady_chapel
  
  has_many :towers
  accepts_nested_attributes_for :towers, reject_if: :all_blank, allow_destroy: true
  
  belongs_to :church
end
