require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { active_date_from: @address.active_date_from, active_date_to: @address.active_date_to, addr_status: @address.addr_status, city: @address.city, county_id: @address.county_id, line_1: @address.line_1, line_2: @address.line_2, person_id: @address.person_id, state: @address.state, zip_code: @address.zip_code }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    put :update, id: @address, address: { active_date_from: @address.active_date_from, active_date_to: @address.active_date_to, addr_status: @address.addr_status, city: @address.city, county_id: @address.county_id, line_1: @address.line_1, line_2: @address.line_2, person_id: @address.person_id, state: @address.state, zip_code: @address.zip_code }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
