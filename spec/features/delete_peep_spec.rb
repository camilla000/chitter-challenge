feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peep.create(text: "Peep1")
    visit '/peeps'
    expect(page).to have_content "Peep1"
    

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content "Peep1"
  end
end