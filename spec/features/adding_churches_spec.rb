require 'rails_helper'

feature 'adding a church' do
  let (:church) {create(:church) }
  
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
     fill_in 'Name', with: 'Church 1'
     select '700-725', :from => 'Date first mention in text'
     fill_in 'First mention description', with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
     select '700-725', :from => 'Date earliest extant fabric'
     fill_in 'Earliest extant fabric description', with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
     select '700-725', :from => 'Date earliest extant fabric'
     fill_in 'General narrative', with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
     fill_in "Town", with: "Town"
     select "Suffolk", :from => "Buildings of england volume"
     select "Suffolk", :from => "County"
     select "Norwich", :from => "Diocese"
     fill_in "Archdeaconry", with: "York"
     fill_in "Longitude", with: "50.1"
     fill_in "Latitude", with: "50.2"
     click_button 'Save/Next-Add Fabric'
     expect(current_path).to eq new_church_fabric_path(Church.find_by(name: 'Church 1').id)
    end
  end
  
  context 'adding fabric information' do
    scenario 'addind nave' do 
      visit new_church_fabric_path(church.id)
      within('.nave') do
        select '700-725', :from => 'Date'
        find("#fabric_nave_attributes_date_secured").set(true) 
        fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
      end
      click_button 'submit'
      expect(current_path).to eq root_path
      expect(page).to have_content church.name.capitalize
    end
    
    scenario 'adding alter information' do
      visit new_church_fabric_path(church.id)
      fill_nave_information
      within('.alter') do
        find("#fabric_alter_attributes_medieval_alter").set(true) 
        select '700-725', :from => 'Date'
        fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
        fill_in 'Location', with: "Quisque velit nisi."
      end
      click_button 'submit'
      expect(page).to have_content church.name.capitalize
    end
  end
end
