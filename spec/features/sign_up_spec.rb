feature 'A user can register' do
  scenario 'new users details are saved to the database' do
    visit '/'
    click_button "Sign Up"
    fill_in "name", with: "Alexander Hamilton"
    fill_in "email", with: "a.ham@email.com"
    fill_in "password", with: "work"
    click_button "Submit"
    expect(page).to have_content("Hey Alexander Hamilton!")
  end
end