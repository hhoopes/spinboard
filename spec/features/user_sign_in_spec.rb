require 'rails_helper'

feature "user signs in" do
  scenario "user sees their links" do
    user = create(:user)
    sign_in(user)

    visit "/"

    expect(page).to have_content(user.email)
    expect(page).to have_content("Your Links")
  end
end
