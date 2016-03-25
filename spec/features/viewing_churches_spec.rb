require 'rails_helper'

feature 'viewing churches' do 
  let!(:church) { create(:church) }
  
  context 'added by others' do 
    scenario 'initial information' do
      visit root_path
      click_link church.name
      expect(current_path).to eq church_path(church.id)
      expect(page).to have_content 
        church.name
        church.date_first_mention_in_text
        church.first_mention_description
        church.date_earliest_extant_fabric
        church.date_earliest_extant_fabric_secured
        church.earliest_extant_fabric_description
        church.town
        church.buildings_of_england_volume
        church.county
        church.diocese
        church.archdeaconry
        church.longitude
    end
  end
end