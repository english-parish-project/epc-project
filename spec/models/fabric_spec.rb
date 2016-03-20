require 'rails_helper'

RSpec.describe Fabric, type: :model do
  it {  is_expected.to belong_to(:church) }
  it {  is_expected.to have_one(:alter) }
  it {  is_expected.to have_one(:chancel) }
  it {  is_expected.to have_many(:chantry_chapels) }
  it {  is_expected.to have_many(:doors) }
  it {  is_expected.to have_one(:lady_chapel) }
  it {  is_expected.to have_one(:nave) }
  it {  is_expected.to have_one(:piscina) }
  it {  is_expected.to have_one(:porch) }
  it {  is_expected.to have_one(:screen) }
  it {  is_expected.to have_one(:sedilia) }
  it {  is_expected.to have_many(:towers) }
  it {  is_expected.to have_one(:transept) }
end
