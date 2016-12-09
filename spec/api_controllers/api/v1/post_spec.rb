require "rails_helper"

describe "Post API" do
  it "should create new post" do
    user = create(:user)

    post_params = {
      "post" => {
        "title" => "New Title",
        "text" => "New Text"
      }
    }.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    post "/api/v1/posts", post_params, request_headers

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json["title"]).to eq("New Title")
  end

  it "should update post" do
    user = create(:user)
    post = create(:post, user: user)


    post_params = {
      "post" => {
        "title" => "New Title",
        "text" => "New api Text"
      }
    }.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    put "/api/v1/posts/#{post.id}", post_params, request_headers

    json = JSON.parse(response.body)

    # check to make sure the right amount of messages are returned
    expect(json["message"]).to eq("post susccesfully updated")
  end

  it "should destroy post" do
    user = create(:user)
    post = create(:post, user: user)

    post_params = {}.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }


    delete "/api/v1/posts/#{post.id}", post_params, request_headers

    json = JSON.parse(response.body)

    # check to make sure the right amount of messages are returned
    expect(json["title"]).to eq("My New Title")
  end

  it "should show post" do
    user = create(:user)
    post = create(:post, user: user)

    post_params = {}.to_json

    request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "X-Token" => user.auth_token
    }

    get "/api/v1/posts/#{post.id}", post_params, request_headers

    json = JSON.parse(response.body)

    # check to make sure the right amount of messages are returned
    expect(json["title"]).to eq(post.title)
  end
end
