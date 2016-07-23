FactoryGirl.define do
  factory :church do  
    name 'Test Church'
    town "Test Town"
    county "Suffolk"
    buildings_of_england_volume "Suffolk"
    diocese "Norwich"
    archdeaconry "York"
    longitude "50.1"
    latitude "50.2"
    minster_status true
    minster_current_status false
    collegiate_status true
    collegiate_date 900
    first_mentioned_in_text 850
    first_mentioned_in_text_explanation "Lorem ipsum dolor sit amet"
    earliest_extant_fabric_date "700-725"
    earliest_extant_fabric_date_secured true
    earliest_extant_fabric_date_evidence "Lorem ipsum dolor sit amet"
    earliest_extant_fabric_location "Mauris blandit aliquet elit, eget tincidunt"
    notes "Vivamus suscipit tortor eget felis porttitor volutpat."
  end
end
