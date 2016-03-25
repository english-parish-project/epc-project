FactoryGirl.define do
  factory :fabric do
    factory :fabric_with_nave do
      association :church
      association :nave
    end
  end
end
