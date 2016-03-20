require 'rails_helper'

RSpec.describe Screen, type: :model do
  it { is_expected.to belong_to(:fabric) }
end
