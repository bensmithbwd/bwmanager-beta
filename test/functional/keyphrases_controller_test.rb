require 'test_helper'

class KeyphrasesControllerTest < ActionController::TestCase
  setup do
    @keyphrase = keyphrases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keyphrases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keyphrase" do
    assert_difference('Keyphrase.count') do
      post :create, keyphrase: { keyphrase: @keyphrase.keyphrase }
    end

    assert_redirected_to keyphrase_path(assigns(:keyphrase))
  end

  test "should show keyphrase" do
    get :show, id: @keyphrase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keyphrase
    assert_response :success
  end

  test "should update keyphrase" do
    put :update, id: @keyphrase, keyphrase: { keyphrase: @keyphrase.keyphrase }
    assert_redirected_to keyphrase_path(assigns(:keyphrase))
  end

  test "should destroy keyphrase" do
    assert_difference('Keyphrase.count', -1) do
      delete :destroy, id: @keyphrase
    end

    assert_redirected_to keyphrases_path
  end
end
