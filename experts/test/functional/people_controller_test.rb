require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { date_of_birth: @person.date_of_birth, date_of_death: @person.date_of_death, first_name: @person.first_name, hidden_note: @person.hidden_note, last_name: @person.last_name, license: @person.license, middle_initial: @person.middle_initial, social_security_number: @person.social_security_number, spanish_speaking: @person.spanish_speaking, status: @person.status, suffix: @person.suffix, tax_id: @person.tax_id }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    put :update, id: @person, person: { date_of_birth: @person.date_of_birth, date_of_death: @person.date_of_death, first_name: @person.first_name, hidden_note: @person.hidden_note, last_name: @person.last_name, license: @person.license, middle_initial: @person.middle_initial, social_security_number: @person.social_security_number, spanish_speaking: @person.spanish_speaking, status: @person.status, suffix: @person.suffix, tax_id: @person.tax_id }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
