require "rails_helper"

describe "Comment API" do
  it "should create user account" do

    user_params = {
      "user" => {
        "email" => "api@api.ru",
        "password" => "asdasd",
        "full_name" => "Michaeil Johnson"
      }
    }.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json"
    }

    post "/api/v1/register", user_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    if response.status == 200
      expect(json["message"]).to eq("Successfully created new account for email api@api.ru")
    else
      expect(json["message"]).to eq("Failed to create new account for email api@api.ru")
    end
  end

  it "should destroy user account" do
    user = create(:user)

    user_params = {}.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    delete "/api/v1/delete_account", user_params, request_headers

    json = JSON.parse(response.body)

    expect(json["message"]).to eq("Successfully deleted the account.")
  end
end
