require 'rails_helper'

RSpec.describe Piscina, type: :model do
  it { is_expected.to belong_to(:fabric) }
end
