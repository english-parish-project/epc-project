def fill_nave_information
  within('.nave') do
    select '700-725', :from => 'Date'
    fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
  end
end

def fill_altar_information
  within('.altar') do
    find("#fabric_altar_attributes_medieval_altar").set(true) 
    select '700-725', :from => 'Date'
    fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
    fill_in 'Location', with: "Quisque velit nisi."
  end
end