require 'rails_helper'

feature 'viewing churches' do 
  let!(:church) { create(:church) }
  let!(:fabric) { create(:fabric_with_all_info, church_id: church.id) }
  
  context 'added by others' do 
    scenario 'initial information' do
      visit root_path
      click_link church.name.capitalize
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
    
    scenario 'nave information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.nave.date
        church.fabric.nave.date_secured
        church.fabric.nave.date_information
    end
    scenario 'alter information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.alter.medieval_alter
        church.fabric.alter.date
        church.fabric.alter.date_secured
        church.fabric.alter.date_information
        church.fabric.alter.location
    end
  end
end