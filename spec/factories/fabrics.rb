FactoryGirl.define do
  factory :fabric do
    factory :fabric_with_nave do
      association :church
      association :nave
    end
    
    factory :fabric_with_all_info do
      styles ["Anglo-Saxon", "Saxon-Norman Overlap"]
      association :church
      association :nave
      association :chancel
      association :porch
      association :sedilia
      association :piscina
      association :font
      association :screen
      association :transept
      association :lady_chapel
      after(:create) { |fabric| create(:chantry_chapel, fabric: fabric) }
      after(:create) { |fabric| create(:tower, fabric: fabric) }
      after(:create) { |fabric| create(:door, fabric: fabric) }
      after(:create) { |fabric| create(:altar, fabric: fabric) }
    end
  end
end
