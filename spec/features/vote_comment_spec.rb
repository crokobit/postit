require "spec_helper"

feature "vote comment", { js: true }do
  scenario "vote comment" do
    Fabricate(:post) { comments(count: 1) }

    user_sign_in

    click_post_comments(1)
    
    within("div#comment_1") do
      message = accept_alert do
        find(".icon-arrow-up").click
      end
      expect(page).to have_content "1 votes"
      expect(message).to eq "voted successfully"
    end
  end

  scenario "post voted already" do
    user = Fabricate(:user)
    comment = Fabricate(:comment)
    comment.votes.create(vote_value: true, creator: user)
    first_post = Fabricate(:post)
    first_post.comments << comment
    
    user_sign_in(user)

    click_post_comments(1)

    within("div#comment_1") do
      message = accept_alert do
        find(".icon-arrow-up").click
      end
      expect(message).to eq "voted already"
      expect(page).to have_content "1 votes"
    end
  end

  scenario "need sign in to vote post" do
    Fabricate(:post) { comments(count: 1) }
    
    visit '/'

    click_post_comments(1)

    expect(page).to have_content "need log in to do that"
  end
end

