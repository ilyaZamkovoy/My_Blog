require "rails_helper"

feature "Create Post" do
  include_context "current user signed in"
    scenario "user creates new post" do
      post = build(:post)

      visit new_post_path

      fill_in "Title", with: post.title
      fill_in "Text", with: post.text

      click_on("Create Post")

      expect(page).to have_content("My New Title")
      expect(page).to have_content("My New Text")
    end
end
