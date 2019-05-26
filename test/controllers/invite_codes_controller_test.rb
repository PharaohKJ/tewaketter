require 'test_helper'

class InviteCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invite_code = invite_codes(:one)
  end

  test "should get index" do
    get invite_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_invite_code_url
    assert_response :success
  end

  test "should create invite_code" do
    assert_difference('InviteCode.count') do
      post invite_codes_url, params: { invite_code: { code: @invite_code.code, config_id: @invite_code.config_id, finish: @invite_code.finish, start: @invite_code.start } }
    end

    assert_redirected_to invite_code_url(InviteCode.last)
  end

  test "should show invite_code" do
    get invite_code_url(@invite_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_invite_code_url(@invite_code)
    assert_response :success
  end

  test "should update invite_code" do
    patch invite_code_url(@invite_code), params: { invite_code: { code: @invite_code.code, config_id: @invite_code.config_id, finish: @invite_code.finish, start: @invite_code.start } }
    assert_redirected_to invite_code_url(@invite_code)
  end

  test "should destroy invite_code" do
    assert_difference('InviteCode.count', -1) do
      delete invite_code_url(@invite_code)
    end

    assert_redirected_to invite_codes_url
  end
end
