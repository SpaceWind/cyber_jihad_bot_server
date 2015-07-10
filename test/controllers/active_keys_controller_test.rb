require 'test_helper'

class ActiveKeysControllerTest < ActionController::TestCase
  setup do
    @active_key = active_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:active_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create active_key" do
    assert_difference('ActiveKey.count') do
      post :create, active_key: { apikey: @active_key.apikey, heroid: @active_key.heroid, last_controlled: @active_key.last_controlled, last_updated: @active_key.last_updated, login: @active_key.login, rolled_heroid: @active_key.rolled_heroid }
    end

    assert_redirected_to active_key_path(assigns(:active_key))
  end

  test "should show active_key" do
    get :show, id: @active_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @active_key
    assert_response :success
  end

  test "should update active_key" do
    patch :update, id: @active_key, active_key: { apikey: @active_key.apikey, heroid: @active_key.heroid, last_controlled: @active_key.last_controlled, last_updated: @active_key.last_updated, login: @active_key.login, rolled_heroid: @active_key.rolled_heroid }
    assert_redirected_to active_key_path(assigns(:active_key))
  end

  test "should destroy active_key" do
    assert_difference('ActiveKey.count', -1) do
      delete :destroy, id: @active_key
    end

    assert_redirected_to active_keys_path
  end
end
