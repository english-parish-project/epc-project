FactoryGirl.define do
  factory :fabric do
    factory :fabric_with_nave do
      association :church
      association :nave
    end
    
    factory :fabric_with_all_info do
      association :church
      association :nave
      association :alter
      association :chancel
    end
  end
end
