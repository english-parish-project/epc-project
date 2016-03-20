require 'rails_helper'

RSpec.describe Alter, type: :model do
  it { is_expected.to belong_to(:fabric) }
end
