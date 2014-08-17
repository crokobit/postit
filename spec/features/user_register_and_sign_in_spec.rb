require 'spec_helper'

feature "user register and sign in" do
  scenario "register and sign in" do
    user_data = Fabricate.build(:user)

    visit '/' 
    click_link "Register"

    fill_in_user_data(user_data)
    find('#register_submit').click

    user_sign_in(user_data)

    expect(page).to have_content user_data.name
    expect(page).to have_content "Log In Success"
  end
end
