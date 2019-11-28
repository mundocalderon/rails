require 'test_helper'

class DpiChaptersControllerTest < ActionController::TestCase
  setup do
    @dpi_chapter = dpi_chapters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dpi_chapters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dpi_chapter" do
    assert_difference('DpiChapter.count') do
      post :create, dpi_chapter: @dpi_chapter.attributes
    end

    assert_redirected_to dpi_chapter_path(assigns(:dpi_chapter))
  end

  test "should show dpi_chapter" do
    get :show, id: @dpi_chapter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dpi_chapter
    assert_response :success
  end

  test "should update dpi_chapter" do
    put :update, id: @dpi_chapter, dpi_chapter: @dpi_chapter.attributes
    assert_redirected_to dpi_chapter_path(assigns(:dpi_chapter))
  end

  test "should destroy dpi_chapter" do
    assert_difference('DpiChapter.count', -1) do
      delete :destroy, id: @dpi_chapter
    end

    assert_redirected_to dpi_chapters_path
  end
end
