require 'test_helper'

class PastiesControllerTest < ActionController::TestCase

  setup do
    @pastie = Pastie.new text:"a test"
    @pastie.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pasties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pastie" do
    assert_difference('Pastie.count') do
      post :create, pastie: { text: @pastie.text }
    end

    assert_redirected_to pastie_path(assigns(:pastie))
  end

  test "should show pastie" do
    get :show, id: @pastie
    assert_response :success
  end

  test "should destroy pastie" do
    assert_difference('Pastie.count', -1) do
      delete :destroy, id: @pastie
    end

    assert_redirected_to pasties_path
  end
end
