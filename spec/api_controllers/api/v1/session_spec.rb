require "rails_helper"

describe "Session API" do
  it "should create user session" do
    user = create(:user, email: "api@api.ru")

    user_params = {
        "email" => user.email,
        "password" => user.password
      }.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
    }

    post "/api/v1/login", user_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["email"]).to eq("api@api.ru")
  end

end
