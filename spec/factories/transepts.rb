FactoryGirl.define do
  factory :transept do
    south_side true
    south_side_date "700-725"
    south_side_date_secured true
    south_side_date_evidence "south side date information"
    south_side_aisled true
    south_side_notes "general notes on south side transept"
    
    north_side true
    north_side_date "700-725"
    north_side_date_secured true
    north_side_date_evidence "north date information"
    north_side_aisled true
    north_side_notes "general notes on north side transept"
  end
end
