require 'spec_helper'

feature "user register and sign in" do
  scenario "register and sign in" do
    visit '/' 
    click_link "Register"
    user = Fabricate(:user)

    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    find('#register_submit').click

    click_link "Log in"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    find("#log_in_button").click

    expect(page).to have_content user.name
    expect(page) to have_content "Log In Success"

    save_and_open_page
  end
end
