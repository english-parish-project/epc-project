require 'rails_helper'

feature 'viewing churches' do 
  let!(:church) { create(:church) }
  let!(:fabric) { create(:fabric_with_all_info, church_id: church.id) }
  
  context 'added by others' do 
    scenario 'initial information' do
      visit root_path
      click_link church.name.capitalize
      expect(current_path).to eq church_path(church.id)
      expect(page).to have_content "#{church.name.capitalize}"
      expect(page).to have_content "#{church.town}"
      expect(page).to have_content "#{church.buildings_of_england_volume}"
      expect(page).to have_content "#{church.county}"
      expect(page).to have_content "#{church.diocese}"
      expect(page).to have_content "#{church.archdeaconry}"
      expect(page).to have_content "#{church.longitude}"
      expect(page).to have_content "#{church.latitude}"
      expect(page).to have_content "#{church.minster_status}"
      expect(page).to have_content "#{church.collegiate_status}"
      expect(page).to have_content "#{church.collegiate_date}"
      expect(page).to have_content "#{church.first_mentioned_in_text}"
      expect(page).to have_content "#{church.first_mentioned_in_text_explanation}"
      expect(page).to have_content "#{church.earliest_extant_fabric_date}"
      expect(page).to have_content "#{church.earliest_extant_fabric_date_secured}"
      expect(page).to have_content "#{church.earliest_extant_fabric_date_evidence}"
      expect(page).to have_content "#{church.general_comments}"
    end
    
    scenario 'nave information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.nave.date}"
      expect(page).to have_content "#{church.fabric.nave.date_secured}"
      expect(page).to have_content "#{church.fabric.nave.date_evidence}"
      expect(page).to have_content "#{church.fabric.nave.styles.first}"
      expect(page).to have_content "#{church.fabric.nave.notes}"
    end
    
    scenario 'alter information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.alter.medieval_alter}"
      expect(page).to have_content "#{church.fabric.alter.date}"
      expect(page).to have_content "#{church.fabric.alter.date_secured}"
      expect(page).to have_content "#{church.fabric.alter.date_evidence}"
      expect(page).to have_content "#{church.fabric.alter.location_in_chancel}"
    end
    
    scenario 'chancel information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.chancel.date}"
      expect(page).to have_content "#{church.fabric.chancel.date_secured}"
      expect(page).to have_content "#{church.fabric.chancel.date_evidence}"
      expect(page).to have_content "#{church.fabric.chancel.chancel_arch_description}"
    end
    
    scenario 'chantry chapel information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.chantry_chapels.first.date}"
      expect(page).to have_content"#{church.fabric.chantry_chapels.first.date_secured}"
      expect(page).to have_content"#{church.fabric.chantry_chapels.first.date_evidence}"
      expect(page).to have_content"#{church.fabric.chantry_chapels.first.location}"
      expect(page).to have_content"#{church.fabric.chantry_chapels.first.notes}"
      expect(page).to have_content"#{church.fabric.chantry_chapels.first.styles.first}"
    end
    
    scenario 'tower information' do
      visit church_path(church.id)
      expect(page).to have_content 
      expect(page).to have_content "#{church.fabric.towers.first.date}"
      expect(page).to have_content "#{church.fabric.towers.first.date_secured}"
      expect(page).to have_content "#{church.fabric.towers.first.date_evidence}"
      expect(page).to have_content "#{church.fabric.towers.first.location}"
      expect(page).to have_content "#{church.fabric.towers.first.notes}"
    end
  end
end