class Fabric < ActiveRecord::Base
  has_one :nave
  has_one :chancel
  has_one :alter
  has_one :sedilia
  has_one :piscina
  has_one :screen
  has_many :doors
  has_one :porch
  has_one :transept
  has_many :chantry_chapels
  has_one :lady_chapel
  has_many :towers
  belongs_to :church
end
