require 'test_helper'

class HDescriptorsControllerTest < ActionController::TestCase
  setup do
    @h_descriptor = h_descriptors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:h_descriptors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create h_descriptor" do
    assert_difference('HDescriptor.count') do
      post :create, h_descriptor: { exp_to_next_lvl: @h_descriptor.exp_to_next_lvl, experience: @h_descriptor.experience, hclass: @h_descriptor.hclass, hero_name: @h_descriptor.hero_name, hid: @h_descriptor.hid, hrace: @h_descriptor.hrace, map: @h_descriptor.map, mood: @h_descriptor.mood, pack_max_size: @h_descriptor.pack_max_size, x_pos: @h_descriptor.x_pos, y_pos: @h_descriptor.y_pos }
    end

    assert_redirected_to h_descriptor_path(assigns(:h_descriptor))
  end

  test "should show h_descriptor" do
    get :show, id: @h_descriptor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @h_descriptor
    assert_response :success
  end

  test "should update h_descriptor" do
    patch :update, id: @h_descriptor, h_descriptor: { exp_to_next_lvl: @h_descriptor.exp_to_next_lvl, experience: @h_descriptor.experience, hclass: @h_descriptor.hclass, hero_name: @h_descriptor.hero_name, hid: @h_descriptor.hid, hrace: @h_descriptor.hrace, map: @h_descriptor.map, mood: @h_descriptor.mood, pack_max_size: @h_descriptor.pack_max_size, x_pos: @h_descriptor.x_pos, y_pos: @h_descriptor.y_pos }
    assert_redirected_to h_descriptor_path(assigns(:h_descriptor))
  end

  test "should destroy h_descriptor" do
    assert_difference('HDescriptor.count', -1) do
      delete :destroy, id: @h_descriptor
    end

    assert_redirected_to h_descriptors_path
  end
end
