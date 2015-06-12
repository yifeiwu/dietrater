require 'test_helper'

class FoodEntriesControllerTest < ActionController::TestCase
  setup do
    @food_entry = food_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_entry" do
    assert_difference('FoodEntry.count') do
      post :create, food_entry: { name: @food_entry.name, serve_size: @food_entry.serve_size }
    end

    assert_redirected_to food_entry_path(assigns(:food_entry))
  end

  test "should show food_entry" do
    get :show, id: @food_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_entry
    assert_response :success
  end

  test "should update food_entry" do
    patch :update, id: @food_entry, food_entry: { name: @food_entry.name, serve_size: @food_entry.serve_size }
    assert_redirected_to food_entry_path(assigns(:food_entry))
  end

  test "should destroy food_entry" do
    assert_difference('FoodEntry.count', -1) do
      delete :destroy, id: @food_entry
    end

    assert_redirected_to food_entries_path
  end
end
