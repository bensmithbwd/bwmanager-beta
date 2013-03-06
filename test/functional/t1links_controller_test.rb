require 'test_helper'

class T1linksControllerTest < ActionController::TestCase
  setup do
    @t1link = t1links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:t1links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create t1link" do
    assert_difference('T1link.count') do
      post :create, t1link: { keyphrase: @t1link.keyphrase, links: @t1link.links }
    end

    assert_redirected_to t1link_path(assigns(:t1link))
  end

  test "should show t1link" do
    get :show, id: @t1link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @t1link
    assert_response :success
  end

  test "should update t1link" do
    put :update, id: @t1link, t1link: { keyphrase: @t1link.keyphrase, links: @t1link.links }
    assert_redirected_to t1link_path(assigns(:t1link))
  end

  test "should destroy t1link" do
    assert_difference('T1link.count', -1) do
      delete :destroy, id: @t1link
    end

    assert_redirected_to t1links_path
  end
end
