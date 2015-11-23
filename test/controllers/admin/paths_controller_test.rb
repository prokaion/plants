require 'test_helper'

class Admin::PathsControllerTest < ActionController::TestCase
  setup do
    @admin_path = admin_paths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_paths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_path" do
    assert_difference('Admin::Path.count') do
      post :create, admin_path: { name: @admin_path.name, shop_id: @admin_path.shop_id }
    end

    assert_redirected_to admin_path_path(assigns(:admin_path))
  end

  test "should show admin_path" do
    get :show, id: @admin_path
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_path
    assert_response :success
  end

  test "should update admin_path" do
    patch :update, id: @admin_path, admin_path: { name: @admin_path.name, shop_id: @admin_path.shop_id }
    assert_redirected_to admin_path_path(assigns(:admin_path))
  end

  test "should destroy admin_path" do
    assert_difference('Admin::Path.count', -1) do
      delete :destroy, id: @admin_path
    end

    assert_redirected_to admin_paths_path
  end
end
