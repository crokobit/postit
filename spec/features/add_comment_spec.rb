require 'spec_helper'

feature "add comment" do
  scenario "add comment" do
    Fabricate(:post)
    user_sign_in

    click_post_comments(1)

    comment = Fabricate(:comment_data)
    fill_in "Leave a comment", with: comment.body
    click_button "Create Comment"

    expect(page).to have_content comment.body
  end
end
