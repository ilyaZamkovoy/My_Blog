require "rails_helper"

# need to fix button problems
feature "Destroy Post", js: true do
  include_context "current user signed in"
    scenario "user destroys post" do
      post = create(:post, user: current_user)

      visit posts_path
      click_on "Delete"

      expect(page).to have_content("Post was successfully destroyed.")
    end
end
