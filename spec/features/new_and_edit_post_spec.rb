require 'spec_helper'

feature "about post" do
  scenario "new and edit post" do
    category_1 = Fabricate(:category)
    category_2 = Fabricate(:category)
    user = Fabricate(:user)
    post_data = Fabricate.build(:post_data)
    post_data_new = Fabricate.build(:post_data)

    user_sign_in(user)

    click_link "New Post"

    fill_in_post_data(post_data,[2])
    click_button "Create Post"

    expect(page).to have_content post_data.title
    expect(page).to have_content post_data.description
    within("div#post_1") do
      expect(page).to have_content category_2.name
      expect(page).to_not have_content category_1.name
    end

    click_post_comments(1)

    click_edit_this_post_link

    fill_in_post_data(post_data_new,[1])
    click_button "Edit Post"

    #save_and_open_page

    expect(page).to have_content post_data_new.title
    expect(page).to have_content post_data_new.description
    within("div#post_1") do
      expect(page).to_not have_content category_2.name
      expect(page).to have_content category_1.name
    end


  end

  def fill_in_post_data(post_data,category_ids)
    fill_in "Title", with: post_data.title 
    fill_in "Url", with: post_data.url
    fill_in "Description", with: post_data.description
    category_ids.each do |id|
      find("#post_category_ids_#{id}").set(true)
    end
    (Category.ids - category_ids).each do |id|
      find("#post_category_ids_#{id}").set(false)
    end
  end

  def have_post_data_content(post_data)
    
  end
end
