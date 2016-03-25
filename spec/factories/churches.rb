FactoryGirl.define do
  factory :church do  
    name 'Test Church'
    date_first_mention_in_text "700-725"
    first_mention_description "Lorem ipsum dolor sit amet"
    date_earliest_extant_fabric "700-725"
    date_earliest_extant_fabric_secured true
    earliest_extant_fabric_description "Lorem ipsum dolor sit amet, fabellas gubergren maiestatis eos no."
    town "Test Town"
    buildings_of_england_volume "Suffolk"
    county "Suffolk"
    diocese "Norwich"
    archdeaconry "York"
    longitude "50.1"
    latitude "50.2"
  end
end
