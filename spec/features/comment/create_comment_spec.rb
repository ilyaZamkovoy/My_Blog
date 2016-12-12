require "rails_helper"

feature "Create Comment" do
  include_context "current user signed in"
  scenario "user creates new comment" do
    post = create(:post, user: current_user)

    visit posting_path(post)

    fill_in "Text", with: "this is new comment"

    click_on("Create Comment")

    expect(page).to have_content("this is new comment")
  end

end
