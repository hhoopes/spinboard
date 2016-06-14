FactoryGirl.define do
  factory :link do
    url "http://example.com"
    title "Title of Link"
  end
  factory :user do
    password "password"
    email "email@example.com"
  end
end
