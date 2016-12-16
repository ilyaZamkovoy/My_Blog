require "rails_helper"

feature "Update Post" do
  include_context "current user signed in"
    scenario "user update post" do
      post = create(:post, user: current_user)

      visit edit_post_path(post)

      fill_in "Title", with: "New Title"
      fill_in "Text", with: "New Text"

      click_on("Update Post")

      expect(page).to have_content("New Title")
      expect(page).to have_content("New Text")
    end
end
