require "spec_helper"

feature "vote", { js: true }do
  scenario "post vote" do
    Fabricate(:post)

    user_sign_in
    
    within("div#post_1") do
      message = accept_alert do
        find(".icon-arrow-up").click
      end
      expect(page).to have_content "1 votes"
      expect(message).to eq "voted successfully"
    end
  end

  scenario "post voted already" do
    user = Fabricate(:user)
    first_post = Fabricate(:post)
    first_post.votes.create(vote_value: true, creator: user)
    
    user_sign_in(user)

    within("div#post_1") do
      message = accept_alert do
        find(".icon-arrow-up").click
      end
      expect(message).to eq "voted already"
      expect(page).to have_content "1 votes"
    end
  end

  scenario "need sign in to vote post" do
    Fabricate(:post)
    
    visit '/'
    within("div#post_1") do
      find(".icon-arrow-up").click
      expect(page).to have_content "0 votes"
    end
  end

end
