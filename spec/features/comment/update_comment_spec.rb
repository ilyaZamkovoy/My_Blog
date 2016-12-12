require "rails_helper"

feature "Update Comment", js: true do
  include_context "current user signed in"
  scenario "user updates his comment" do
    post = create(:post)
    comment = create(:comment, post: post, user: current_user)

    visit posting_path(post)

    click_on("Edit")

    fill_in "Text", with: "this is new test comment"

    click_on("Update Comment")

    expect(page).to have_content("this is new test comment")
  end

end
