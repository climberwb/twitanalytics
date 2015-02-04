require 'test_helper'

class TweetCollectionsControllerTest < ActionController::TestCase
  setup do
    @tweet_collection = tweet_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweet_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweet_collection" do
    assert_difference('TweetCollection.count') do
      post :create, tweet_collection: {  }
    end

    assert_redirected_to tweet_collection_path(assigns(:tweet_collection))
  end

  test "should show tweet_collection" do
    get :show, id: @tweet_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweet_collection
    assert_response :success
  end

  test "should update tweet_collection" do
    patch :update, id: @tweet_collection, tweet_collection: {  }
    assert_redirected_to tweet_collection_path(assigns(:tweet_collection))
  end

  test "should destroy tweet_collection" do
    assert_difference('TweetCollection.count', -1) do
      delete :destroy, id: @tweet_collection
    end

    assert_redirected_to tweet_collections_path
  end
end
