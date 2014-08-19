def fill_in_user_data(user)
  fill_in 'Name', with: user.name
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
end

def user_sign_in(a_user=nil)
  user = a_user || Fabricate(:user)
  visit '/'
  click_link "Log in"
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  find("#log_in_button").click
end

def click_post_comments(id)
  within("div#post_#{id}") do
    find_link("comment").click 
  end
end

def click_edit_this_post_link
  click_link("[edit this post]")
end
