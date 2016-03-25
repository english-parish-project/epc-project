def fill_nave_information
  within('.nave') do
    select '700-725', :from => 'Date'
    fill_in 'Date information', with: "Lorem ipsum dolor sit amet."
  end
end