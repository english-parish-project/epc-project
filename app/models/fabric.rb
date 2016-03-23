class Fabric < ActiveRecord::Base
  has_one :nave
  accepts_nested_attributes_for :nave
  
  has_one :chancel
  accepts_nested_attributes_for :chancel
  
  has_one :alter
  accepts_nested_attributes_for :alter
  
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
  accepts_nested_attributes_for :towers
  
  belongs_to :church
end
