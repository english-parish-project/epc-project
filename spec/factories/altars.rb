FactoryGirl.define do
  factory :altar do
    medieval_altar true
    date "700-725"
    date_secured true
    date_evidence "Altar date information"
    location_in_chancel "Altar lcoation in chancel"
    notes "altar notes"
  end
end
