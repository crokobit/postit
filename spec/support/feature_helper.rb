def fill_in_user_data(user)
  fill_in 'Name', with: user.name
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
end

def user_sign_in(user)
  visit '/'
  click_link "Log in"
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  find("#log_in_button").click
end
