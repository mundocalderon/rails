require 'test_helper'

class PleadingsControllerTest < ActionController::TestCase
  setup do
    @pleading = pleadings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pleadings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pleading" do
    assert_difference('Pleading.count') do
      post :create, pleading: @pleading.attributes
    end

    assert_redirected_to pleading_path(assigns(:pleading))
  end

  test "should show pleading" do
    get :show, id: @pleading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pleading
    assert_response :success
  end

  test "should update pleading" do
    put :update, id: @pleading, pleading: @pleading.attributes
    assert_redirected_to pleading_path(assigns(:pleading))
  end

  test "should destroy pleading" do
    assert_difference('Pleading.count', -1) do
      delete :destroy, id: @pleading
    end

    assert_redirected_to pleadings_path
  end
end
