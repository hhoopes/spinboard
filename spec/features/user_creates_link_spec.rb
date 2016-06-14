require 'rails_helper'

feature "User creates a link" do
  scenario "they see new link on index after refresh" do
    user = create(:user)
    sign_in(user)

    link_params = {
      url: "http://example.com",
      title: "My favorite site"
    }

    fill_in "Link URL", with: link_params[:url]
    fill_in "Title", with: link_params[:title]

    click_on "Submit Link"
    link = Link.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_link(link_params[:title], href: link_params[:url])
  end

  scenario "create invalid link" do
    user = create(:user)
    sign_in(user)

    link_params = {
      url: "invalid link",
      title: "My favorite site"
    }

    fill_in "Link URL", with: link_params[:url]
    fill_in "Title", with: link_params[:title]

    click_on "Submit Link"

    expect(page).to have_content("Please provide a valid URL")
    expect(page).not_to have_link(link_params[:title], href: link_params[:url])
  end

end
