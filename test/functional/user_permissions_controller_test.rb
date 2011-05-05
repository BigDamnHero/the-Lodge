require 'test_helper'

class UserPermissionsControllerTest < ActionController::TestCase
  setup do
    @user_permission = user_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_permission" do
    assert_difference('UserPermission.count') do
      post :create, :user_permission => @user_permission.attributes
    end

    assert_redirected_to user_permission_path(assigns(:user_permission))
  end

  test "should show user_permission" do
    get :show, :id => @user_permission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_permission.to_param
    assert_response :success
  end

  test "should update user_permission" do
    put :update, :id => @user_permission.to_param, :user_permission => @user_permission.attributes
    assert_redirected_to user_permission_path(assigns(:user_permission))
  end

  test "should destroy user_permission" do
    assert_difference('UserPermission.count', -1) do
      delete :destroy, :id => @user_permission.to_param
    end

    assert_redirected_to user_permissions_path
  end
end
