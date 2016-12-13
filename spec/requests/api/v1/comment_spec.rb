require "rails_helper"

describe Api::V1::CommentsController do
  it "should create comment" do
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

    post api_v1_comments_path , comment_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["text"]).to eq("New Text")
  end

  it "should update comment" do
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

    put  api_v1_comment_path(comment), comment_params, request_headers

    json = JSON.parse(response.body)
    byebug
    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["text"]).to eq("New Api Text")
  end

  it "should destroy comment" do
    user = create(:user)
    comment = create(:comment, user: user)

    comment_params = {}

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    delete api_v1_comment_path(comment), comment_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["message"]).to eq("comment susccesfully deleted")
  end

end
