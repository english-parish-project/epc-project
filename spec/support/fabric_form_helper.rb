def fill_nave_information
  within('.nave') do
    select '700-725', :from => 'Date'
    fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
  end
end

def fill_alter_information
  within('.alter') do
    find("#fabric_alter_attributes_medieval_alter").set(true) 
    select '700-725', :from => 'Date'
    fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
    fill_in 'Location', with: "Quisque velit nisi."
  end
end