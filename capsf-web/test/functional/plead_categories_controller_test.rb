require 'test_helper'

class PleadCategoriesControllerTest < ActionController::TestCase
  setup do
    @plead_category = plead_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plead_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plead_category" do
    assert_difference('PleadCategory.count') do
      post :create, plead_category: @plead_category.attributes
    end

    assert_redirected_to plead_category_path(assigns(:plead_category))
  end

  test "should show plead_category" do
    get :show, id: @plead_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plead_category
    assert_response :success
  end

  test "should update plead_category" do
    put :update, id: @plead_category, plead_category: @plead_category.attributes
    assert_redirected_to plead_category_path(assigns(:plead_category))
  end

  test "should destroy plead_category" do
    assert_difference('PleadCategory.count', -1) do
      delete :destroy, id: @plead_category
    end

    assert_redirected_to plead_categories_path
  end
end
