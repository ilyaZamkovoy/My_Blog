require "rails_helper"

feature "Destroy Comment" do
  include_context "current user signed in"
  scenario "user destroys his comment" do
    post = create(:post)
    comment = create(:comment, post: post, user: current_user)

    visit posting_path(post)

    click_on("Delete")

    expect(page).to have_content("comment successfully deleted")
  end

end
