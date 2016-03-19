require 'rails_helper'

feature 'add church' do
  context 'no churches have been added' do
    scenario 'should display a prompt to add a church' do
      visit '/churches'
      expect(page).to have_link 'Add A Church'
    end
  end
end
