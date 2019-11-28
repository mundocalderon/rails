require 'test_helper'

class ContributorsControllerTest < ActionController::TestCase
  setup do
    @contributor = contributors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contributors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contributor" do
    assert_difference('Contributor.count') do
      post :create, contributor: { name: @contributor.name }
    end

    assert_redirected_to contributor_path(assigns(:contributor))
  end

  test "should show contributor" do
    get :show, id: @contributor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contributor
    assert_response :success
  end

  test "should update contributor" do
    put :update, id: @contributor, contributor: { name: @contributor.name }
    assert_redirected_to contributor_path(assigns(:contributor))
  end

  test "should destroy contributor" do
    assert_difference('Contributor.count', -1) do
      delete :destroy, id: @contributor
    end

    assert_redirected_to contributors_path
  end
end
