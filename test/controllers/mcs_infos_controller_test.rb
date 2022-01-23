require 'test_helper'

class McsInfosControllerTest < ActionController::TestCase
  setup do
    @mcs_info = mcs_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mcs_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mcs_info" do
    assert_difference('McsInfo.count') do
      post :create, mcs_info: { attachment: @mcs_info.attachment, info_type: @mcs_info.info_type }
    end

    assert_redirected_to mcs_info_path(assigns(:mcs_info))
  end

  test "should show mcs_info" do
    get :show, id: @mcs_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mcs_info
    assert_response :success
  end

  test "should update mcs_info" do
    patch :update, id: @mcs_info, mcs_info: { attachment: @mcs_info.attachment, info_type: @mcs_info.info_type }
    assert_redirected_to mcs_info_path(assigns(:mcs_info))
  end

  test "should destroy mcs_info" do
    assert_difference('McsInfo.count', -1) do
      delete :destroy, id: @mcs_info
    end

    assert_redirected_to mcs_infos_path
  end
end
