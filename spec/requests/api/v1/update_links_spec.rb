require "rails_helper"

describe "links#update API", js: true do
  it "changes the status of a link" do
    user = create(:user)
    user.links << create(:link, read: false)
    link = Link.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    new_link_params = {
      "read": true
    }

    put "/api/v1/links/#{link.id}", JSON.dump(link: new_link_params), "CONTENT_TYPE" => "application/json"

    expect(response).to be_success
    expect(link.read).to eq true
    expect(link.read).not_to eq true
  end
end
