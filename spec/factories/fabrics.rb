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
      association :alter
      association :chancel
      after(:create) { |fabric| create(:chantry_chapel, fabric: fabric) }
      after(:create) { |fabric| create(:tower, fabric: fabric) }
    end
  end
end
