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
      expect(page).to have_content "#{church.notes}"
    end
    
    scenario 'nave information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.nave.date}"
      expect(page).to have_content "#{church.fabric.nave.date_secured}"
      expect(page).to have_content "#{church.fabric.nave.date_evidence}"
      expect(page).to have_content "#{church.fabric.nave.styles.first}"
      expect(page).to have_content "#{church.fabric.nave.notes}"
    end
    
    scenario 'altar information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.altars.first.medieval_altar}"
      expect(page).to have_content "#{church.fabric.altars.first.date}"
      expect(page).to have_content "#{church.fabric.altars.first.date_secured}"
      expect(page).to have_content "#{church.fabric.altars.first.date_evidence}"
      expect(page).to have_content "#{church.fabric.altars.first.location_in_chancel}"
      expect(page).to have_content "#{church.fabric.altars.first.notes}"
    end
    
    scenario 'chancel information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.chancel.date}"
      expect(page).to have_content "#{church.fabric.chancel.date_secured}"
      expect(page).to have_content "#{church.fabric.chancel.date_evidence}"
      expect(page).to have_content "#{church.fabric.chancel.notes}"
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
      expect(page).to have_content "#{church.fabric.towers.first.date}"
      expect(page).to have_content "#{church.fabric.towers.first.date_secured}"
      expect(page).to have_content "#{church.fabric.towers.first.date_evidence}"
      expect(page).to have_content "#{church.fabric.towers.first.location}"
      expect(page).to have_content "#{church.fabric.towers.first.notes}"
    end
    
    scenario 'door information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.doors.first.original}"
      expect(page).to have_content "#{church.fabric.doors.first.location}"
      expect(page).to have_content "#{church.fabric.doors.first.notes}"
    end
    
    scenario 'porch information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.porch.vaulting}"
      expect(page).to have_content "#{church.fabric.porch.vaulting_type}"
      expect(page).to have_content "#{church.fabric.porch.date}"
      expect(page).to have_content "#{church.fabric.porch.date_secured}"
      expect(page).to have_content "#{church.fabric.porch.date_evidence}"
      expect(page).to have_content "#{church.fabric.porch.location}"
      expect(page).to have_content "#{church.fabric.porch.notes}"
    end
    
    scenario 'sedilia information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.sedilia.date}"
      expect(page).to have_content "#{church.fabric.sedilia.date_secured}"
      expect(page).to have_content "#{church.fabric.sedilia.date_evidence}"
      expect(page).to have_content "#{church.fabric.sedilia.styles.first}"
      expect(page).to have_content "#{church.fabric.sedilia.notes}"
    end
    
    scenario 'piscina information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.piscina.date}"
      expect(page).to have_content "#{church.fabric.piscina.date_secured}"
      expect(page).to have_content "#{church.fabric.piscina.date_evidence}"
      expect(page).to have_content "#{church.fabric.piscina.location}"
      expect(page).to have_content "#{church.fabric.piscina.notes}"
    end
    
    scenario 'font information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.font.date}"
      expect(page).to have_content "#{church.fabric.font.date_secured}"
      expect(page).to have_content "#{church.fabric.font.date_evidence}"
      expect(page).to have_content "#{church.fabric.font.location}"
      expect(page).to have_content "#{church.fabric.font.notes}"
    end
    
    scenario 'screen information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.screen.date}"
      expect(page).to have_content "#{church.fabric.screen.date_secured}"
      expect(page).to have_content "#{church.fabric.screen.date_evidence}"
      expect(page).to have_content "#{church.fabric.screen.notes}"
    end
    
    scenario 'transept information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.transept.south_side}"
      expect(page).to have_content "#{church.fabric.transept.south_side_date}"
      expect(page).to have_content "#{church.fabric.transept.south_side_date_secured}"
      expect(page).to have_content "#{church.fabric.transept.south_side_date_evidence}"
      expect(page).to have_content "#{church.fabric.transept.south_side_aisled}"
      expect(page).to have_content "#{church.fabric.transept.south_side_notes}"
      expect(page).to have_content "#{church.fabric.transept.north_side}"
      expect(page).to have_content "#{church.fabric.transept.north_side_date}"
      expect(page).to have_content "#{church.fabric.transept.north_side_date_secured}"
      expect(page).to have_content "#{church.fabric.transept.north_side_date_evidence}"
      expect(page).to have_content "#{church.fabric.transept.north_side_aisled}"
      expect(page).to have_content "#{church.fabric.transept.north_side_notes}"
    end
    
    scenario 'lady chapel information' do
      visit church_path(church.id)
      expect(page).to have_content "#{church.fabric.lady_chapel.date}"
      expect(page).to have_content "#{church.fabric.lady_chapel.date_secured}"
      expect(page).to have_content "#{church.fabric.lady_chapel.date_evidence}"
      expect(page).to have_content "#{church.fabric.lady_chapel.location}"
      expect(page).to have_content "#{church.fabric.lady_chapel.styles.first}"
      expect(page).to have_content "#{church.fabric.lady_chapel.notes}"
    end
  end
end