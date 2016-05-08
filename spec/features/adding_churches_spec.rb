require 'rails_helper'

feature 'adding a church' do
  let (:church) {create(:church) }
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
     find("#church_minster_status").set(true)
     find("#church_collegiate_status").set(true)
     fill_in "church[first_mentioned_in_text]", with: 700
     fill_in "church[first_mentioned_in_text_information]", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
     select '700-725', :from => "church[earliest_extant_fabric_date]"
     fill_in "church[earliest_extant_fabric_date_information]", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
     fill_in "church[earliest_extant_fabric_location]", with: "location of earliest extant fabric"
     fill_in "church[general_notes]", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
     
     click_button 'Save/Next-Add Fabric'
     expect(current_path).to eq new_church_fabric_path(Church.find_by(name: 'Church 1').id)
    end
  end
  
  context 'adding fabric information' do
    scenario 'adding nave' do 
      visit new_church_fabric_path(church.id)
      within('.nave') do
        select '700-725', :from => 'Date'
        choose('Yes')
        find("#fabric_nave_attributes_styles_saxon-norman_overlap").set(true)
        fill_in "fabric[nave_attributes][date_information]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[nave_attributes][general_notes]", with: "fabric general notes"
      end
      click_button 'submit'
      visit church_path(church.id)
      expect(page).to have_content "Nave"
    end
    
    scenario 'adding alter information' do
      visit new_church_fabric_path(church.id)
      within('.alter') do
        select '700-725', :from => 'Date'
        choose("Yes")
        fill_in "fabric[alter_attributes][date_information]", with: "Lorem ipsum dolor sit amet."
        fill_in "fabric[alter_attributes][location_in_chancel]", with: "Quisque velit nisi."
      end
      click_button 'submit'
      visit church_path(church.id)
      expect(page).to have_content "Alter"
    end
    
    scenario 'adding chancel information' do
      visit new_church_fabric_path(church.id)
      within('.chancel') do
        select '700-725', :from => 'Date'
        fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
        fill_in 'Chancel arch description', with: "Quisque velit nisi."
      end
      click_button 'submit'
      visit church_path(church.id)
      expect(page).to have_content "Chancel"
    end
  end
end
