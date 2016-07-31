require 'rails_helper'

feature 'adding a church' do
  let(:church) {create(:church) }
  before(:each) do 
    create(:style_1)
    create(:style_2)
  end
  
  context 'when there are no churches' do
    scenario 'prompts user to add a church' do
      visit root_path
      expect(page).to have_link 'Add A Church'
    end
  end
  
  context 'adding initial church information' do
    scenario 'prompts user to fill out a form' do
      visit root_path
      click_link 'Add A Church'
      fill_in "church[name]", with: 'Church 1'
      fill_in "church[town]", with: "Town"
      select "Suffolk", :from => "church[buildings_of_england_volume]"
      select "Suffolk", :from => "church[county]"
      select "Norwich", :from => "church[diocese]"
      fill_in "Archdeaconry", with: "church[archdeaconry]"
      fill_in "church[longitude]", with: "50.1"
      fill_in "church[latitude]", with: "50.2"
      select 'Yes', from: "church[minster_status]"
      select 'Yes', from: "church[collegiate_status]"
      fill_in "church[first_mentioned_in_text]", with: 700
      fill_in "church[first_mentioned_in_text_explanation]", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      select '700-725', :from => "church[earliest_extant_fabric_date]"
      fill_in "church[earliest_extant_fabric_date_evidence]", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      fill_in "church[earliest_extant_fabric_location]", with: "location of earliest extant fabric"
      fill_in "church[notes]", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      click_button 'Save/Next-Add Fabric'
      expect(current_path).to eq fabric_form_part1_path(Church.first.fabric.id)
    end
  end
  
  context 'adding fabric information part 1' do
    before(:each) do 
      church.create_fabric 
      visit fabric_form_part1_path(church.fabric.id)
    end
    
    scenario 'adding nave' do 
      within('.nave') do
        select '700-725', :from => 'Date'
        select 'No', from: "fabric[nave_attributes][date_secured]"
        find("#fabric_nave_attributes_styles_saxon-norman_overlap").set(true)
        fill_in "fabric[nave_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[nave_attributes][notes]", with: "fabric general notes"
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Nave"
    end
    
    scenario 'adding tower information' do
      within('.tower') do
        select '700-725', from: "fabric[towers_attributes][0][date]"
        fill_in "fabric[towers_attributes][0][location]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[towers_attributes][0][date_evidence]", with: "Quisque velit nisi."
        fill_in "fabric[towers_attributes][0][notes]", with: "Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Tower 1"
    end  
    
    scenario 'adding door information' do
      within('.door') do
        fill_in "fabric[doors_attributes][0][location]", with: "Lorem ipsum dolor sit amet."
        select 'Yes', from: "fabric[doors_attributes][0][original]"
        fill_in "fabric[doors_attributes][0][notes]", with: "Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Door 1"
    end
    
    scenario 'adding porch information' do
      within('.porch') do
        select '700-725', from: "fabric[porch_attributes][date]"
        select 'Yes', from: "fabric[porch_attributes][date_secured]"
        select 'Yes', from: "fabric[porch_attributes][vaulting]"
        fill_in "fabric[porch_attributes][vaulting_type]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[porch_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[porch_attributes][location]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[porch_attributes][notes]", with: "Lorem ipsum dolor sit amet."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Porch"
    end
  end
    
  context 'adding fabric information part 2' do
    before(:each) do 
      church.create_fabric 
      visit fabric_form_part2_path(church.fabric.id)
    end
    
    scenario 'adding chancel information' do
      within('.chancel') do
        select '700-725', from: "fabric[chancel_attributes][date]"
        select 'Yes', from: "fabric[chancel_attributes][date_secured]"
        fill_in "fabric[chancel_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[chancel_attributes][notes]", with: "chancel notes."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Chancel"
    end
    
    scenario 'adding altar information' do
      within('.altar') do
        select '700-725', :from => 'fabric[altars_attributes][0][date]'
        select 'Yes', from: "fabric[altars_attributes][0][date_secured]"
        fill_in "fabric[altars_attributes][0][date_evidence]", with: "Lorem ipsum dolor sit am"
        fill_in "fabric[altars_attributes][0][location_in_chancel]", with: "Quisque velit nisi."
        fill_in "fabric[altars_attributes][0][notes]", with: "Notes Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Altar 1"
    end
    
    scenario 'adding Chantry Chapel information' do
      within('.chantry_chapel') do
        select '700-725', from: "fabric[chantry_chapels_attributes][0][date]"
        select 'Yes', from: "fabric[chantry_chapels_attributes][0][date_secured]"
        fill_in "fabric[chantry_chapels_attributes][0][location]", with: "location - Lorem ipsum dolor sit amet."
        fill_in "fabric[chantry_chapels_attributes][0][date_evidence]", with: "Date evidence - Quisque velit nisi."
        fill_in "fabric[chantry_chapels_attributes][0][funding_information]", with: "Funding information - Lorem ipsum dolor sit amet."
        fill_in "fabric[chantry_chapels_attributes][0][notes]", with: "Notes - Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Chantry Chapel 1"
    end
    
    scenario 'adding sedilia' do 
      within('.sedilia') do
        select '700-725', :from => 'Date'
        select 'No', from: "fabric[sedilia_attributes][date_secured]"
        find("#fabric_sedilia_attributes_styles_saxon-norman_overlap").set(true)
        fill_in "fabric[sedilia_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[sedilia_attributes][notes]", with: "fabric general notes"
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Sedilia"
    end
    
    scenario 'adding piscina information' do
      within('.piscina') do
        select '700-725', :from => 'Date'
        select 'Yes', from: "fabric[piscina_attributes][date_secured]"
        fill_in "fabric[piscina_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[piscina_attributes][location]", with: "Quisque velit nisi."
        fill_in "fabric[piscina_attributes][notes]", with: "Notes Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Piscina"
    end
    
    scenario 'adding font information' do
      within('.font') do
        select '700-725', :from => 'Date'
        select 'Yes', from: "fabric[font_attributes][date_secured]"
        fill_in "fabric[font_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[font_attributes][location]", with: "Quisque velit nisi."
        fill_in "fabric[font_attributes][notes]", with: "Notes Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Font"
    end
    
    scenario 'adding screen information' do
      within('.screen') do
        select '700-725', :from => 'Date'
        select 'Yes', from: "fabric[screen_attributes][date_secured]"
        fill_in "fabric[screen_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[screen_attributes][notes]", with: "Notes Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Screen"
    end
    
    scenario 'adding transept information' do
  
      within('.transept') do
        select 'Yes', from: "fabric[transept_attributes][south_side]"
        select '700-725', :from => "fabric[transept_attributes][south_side_date]"
        select 'Yes', from: "fabric[transept_attributes][south_side_date_secured]"
        fill_in "fabric[transept_attributes][south_side_date_evidence]", with: "Lorem ipsum dolor sit amet."
        select 'Yes', from: "fabric[transept_attributes][south_side_aisled]"
        fill_in "fabric[transept_attributes][south_side_notes]", with: "Notes Quisque velit nisi."
        
        select 'Yes', from: "fabric[transept_attributes][north_side]"
        select '700-725', :from => "fabric[transept_attributes][north_side_date]"
        select 'Yes', from: "fabric[transept_attributes][north_side_date_secured]"
        fill_in "fabric[transept_attributes][north_side_date_evidence]", with: "Lorem ipsum dolor sit amet."
        select 'No', from: "fabric[transept_attributes][north_side_aisled]"
        fill_in "fabric[transept_attributes][north_side_notes]", with: "Notes Quisque velit nisi."
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Transept"
    end
    
    scenario 'adding lady chapel' do 
      within('.lady_chapel') do
        fill_in "fabric[lady_chapel_attributes][location]", with: "Quisque velit nisi."
        select '700-725', :from => 'Date'
        select 'No', from: "fabric[lady_chapel_attributes][date_secured]"
        find("#fabric_lady_chapel_attributes_styles_saxon-norman_overlap").set(true)
        fill_in "fabric[lady_chapel_attributes][date_evidence]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[lady_chapel_attributes][notes]", with: "fabric general notes"
      end
      click_button 'Submit'
      visit church_path(church.id)
      expect(page).to have_content "Lady Chapel"
    end
  end
end