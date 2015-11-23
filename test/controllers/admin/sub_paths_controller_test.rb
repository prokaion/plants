require 'test_helper'

class Admin::SubPathsControllerTest < ActionController::TestCase
  setup do
    @admin_sub_path = admin_sub_paths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sub_paths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_sub_path" do
    assert_difference('Admin::SubPath.count') do
      post :create, admin_sub_path: { id_ref: @admin_sub_path.id_ref, part: @admin_sub_path.part, path_id: @admin_sub_path.path_id, terminator: @admin_sub_path.terminator }
    end

    assert_redirected_to admin_sub_path_path(assigns(:admin_sub_path))
  end

  test "should show admin_sub_path" do
    get :show, id: @admin_sub_path
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_sub_path
    assert_response :success
  end

  test "should update admin_sub_path" do
    patch :update, id: @admin_sub_path, admin_sub_path: { id_ref: @admin_sub_path.id_ref, part: @admin_sub_path.part, path_id: @admin_sub_path.path_id, terminator: @admin_sub_path.terminator }
    assert_redirected_to admin_sub_path_path(assigns(:admin_sub_path))
  end

  test "should destroy admin_sub_path" do
    assert_difference('Admin::SubPath.count', -1) do
      delete :destroy, id: @admin_sub_path
    end

    assert_redirected_to admin_sub_paths_path
  end
end
