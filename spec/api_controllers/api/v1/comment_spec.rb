require "rails_helper"

describe "Comment API" do
  it "comment create" do
    user  = create(:user)
    post = create(:post)

    comment_params = {
      "comment" => {
        "text" => "New Text",
        "post_id" => post.id
      }
    }.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    post "/api/v1/comments", comment_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["text"]).to eq("New Text")
  end

  it "comment update" do
    user = create(:user)
    comment = create(:comment, user: user)

    comment_params = {
      "comment" => {
        "text" => "New Api Text"
      }
    }.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    put "/api/v1/comments/#{comment.id}", comment_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["text"]).to eq("New Api Text")
  end

  it "comment destroy" do
    user = create(:user)
    comment = create(:comment, user: user)

    comment_params = {}.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    delete "/api/v1/comments/#{comment.id}", comment_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["text"]).to eq("New Api Text")
  end

end
