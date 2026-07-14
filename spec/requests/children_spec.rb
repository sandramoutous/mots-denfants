require "rails_helper"

RSpec.describe "Children", type: :request do
  let(:user) { User.create!(email: "a@test.com", password: "password123") }
  let(:other_user) { User.create!(email: "b@test.com", password: "password123") }
  let(:other_child) { other_user.children.create!(name: "Léo") }

  before { sign_in user }

  it "doesn't allow the access of other user's children" do
    get child_path(other_child)
    expect(response).to have_http_status(:not_found)
  end
end
