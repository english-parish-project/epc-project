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
        church.town
        church.buildings_of_england_volume
        church.county
        church.diocese
        church.archdeaconry
        church.longitude
        church.latitude
        church.minster_status
        church.collegiate_status
        church.collegiate_date
        church.first_mentioned_in_text
        church.first_mentioned_in_text_explanation
        church.earliest_extant_fabric_date
        church.earliest_extant_fabric_date_secured
        church.earliest_extant_fabric_date_evidence
        church.general_comments
    end
    
    scenario 'nave information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.nave.date
        church.fabric.nave.date_secured
        church.fabric.nave.date_evidence
        church.fabric.nave.styles
        church.fabric.nave.notes
    end
    
    scenario 'alter information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.alter.medieval_alter
        church.fabric.alter.date
        church.fabric.alter.date_secured
        church.fabric.alter.date_evidence
        church.fabric.alter.location_in_chancel
    end
    
    scenario 'chancel information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.chancel.date
        church.fabric.chancel.date_secured
        church.fabric.chancel.date_evidence
        church.fabric.chancel.chancel_arch_description
    end
    
    scenario 'chantry chapel information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.chantry_chapels.first.date
        church.fabric.chantry_chapels.first.date_secured
        church.fabric.chantry_chapels.first.date_evidence
        church.fabric.chantry_chapels.first.location
        church.fabric.chantry_chapels.first.notes
    end
    
    scenario 'tower information' do
      visit church_path(church.id)
      expect(page).to have_content 
        church.fabric.towers.first.date
        save_and_open_page
        church.fabric.towers.first.date_secured
        church.fabric.towers.first.date_evidence
        church.fabric.towers.first.location
        church.fabric.towers.first.notes
    end
  end
end