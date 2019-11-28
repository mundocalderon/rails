require 'test_helper'

class PleadKeywordsControllerTest < ActionController::TestCase
  setup do
    @plead_keyword = plead_keywords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plead_keywords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plead_keyword" do
    assert_difference('PleadKeyword.count') do
      post :create, plead_keyword: @plead_keyword.attributes
    end

    assert_redirected_to plead_keyword_path(assigns(:plead_keyword))
  end

  test "should show plead_keyword" do
    get :show, id: @plead_keyword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plead_keyword
    assert_response :success
  end

  test "should update plead_keyword" do
    put :update, id: @plead_keyword, plead_keyword: @plead_keyword.attributes
    assert_redirected_to plead_keyword_path(assigns(:plead_keyword))
  end

  test "should destroy plead_keyword" do
    assert_difference('PleadKeyword.count', -1) do
      delete :destroy, id: @plead_keyword
    end

    assert_redirected_to plead_keywords_path
  end
end
