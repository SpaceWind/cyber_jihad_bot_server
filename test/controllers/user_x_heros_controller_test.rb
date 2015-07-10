require 'test_helper'

class UserXHerosControllerTest < ActionController::TestCase
  setup do
    @user_x_hero = user_x_heros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_x_heros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_x_hero" do
    assert_difference('UserXHero.count') do
      post :create, user_x_hero: { heroid: @user_x_hero.heroid, login: @user_x_hero.login }
    end

    assert_redirected_to user_x_hero_path(assigns(:user_x_hero))
  end

  test "should show user_x_hero" do
    get :show, id: @user_x_hero
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_x_hero
    assert_response :success
  end

  test "should update user_x_hero" do
    patch :update, id: @user_x_hero, user_x_hero: { heroid: @user_x_hero.heroid, login: @user_x_hero.login }
    assert_redirected_to user_x_hero_path(assigns(:user_x_hero))
  end

  test "should destroy user_x_hero" do
    assert_difference('UserXHero.count', -1) do
      delete :destroy, id: @user_x_hero
    end

    assert_redirected_to user_x_heros_path
  end
end
