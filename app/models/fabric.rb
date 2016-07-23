class Fabric < ActiveRecord::Base
  has_one :nave
  accepts_nested_attributes_for :nave, reject_if: :all_blank, allow_destroy: true
  
  has_one :chancel
  accepts_nested_attributes_for :chancel, reject_if: :all_blank, allow_destroy: true
  
  has_one :altar
  accepts_nested_attributes_for :altar, reject_if: :all_blank, allow_destroy: true
  
  has_one :sedilia
  accepts_nested_attributes_for :sedilia, reject_if: :all_blank, allow_destroy: true
  
  has_one :piscina
  accepts_nested_attributes_for :piscina,  reject_if: :all_blank, allow_destroy: true
  
  has_one :screen
  accepts_nested_attributes_for :screen,  reject_if: :all_blank, allow_destroy: true
  
  has_many :doors
  accepts_nested_attributes_for :doors,  reject_if: :all_blank, allow_destroy: true
  
  has_one :porch
  accepts_nested_attributes_for :porch,  reject_if: :all_blank, allow_destroy: true
  
  has_one :transept
  accepts_nested_attributes_for :transept,  reject_if: :all_blank, allow_destroy: true
  
  has_many :chantry_chapels
  accepts_nested_attributes_for :chantry_chapels, reject_if: :all_blank, allow_destroy: true
  
  has_one :lady_chapel
  accepts_nested_attributes_for :lady_chapel,  reject_if: :all_blank, allow_destroy: true
  
  has_many :towers
  accepts_nested_attributes_for :towers, reject_if: :all_blank, allow_destroy: true
  
  belongs_to :church
end
