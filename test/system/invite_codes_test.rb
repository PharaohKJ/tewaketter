require "application_system_test_case"

class InviteCodesTest < ApplicationSystemTestCase
  setup do
    @invite_code = invite_codes(:one)
  end

  test "visiting the index" do
    visit invite_codes_url
    assert_selector "h1", text: "Invite Codes"
  end

  test "creating a Invite code" do
    visit invite_codes_url
    click_on "New Invite Code"

    fill_in "Code", with: @invite_code.code
    fill_in "Config", with: @invite_code.config_id
    fill_in "Finish", with: @invite_code.finish
    fill_in "Start", with: @invite_code.start
    click_on "Create Invite code"

    assert_text "Invite code was successfully created"
    click_on "Back"
  end

  test "updating a Invite code" do
    visit invite_codes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @invite_code.code
    fill_in "Config", with: @invite_code.config_id
    fill_in "Finish", with: @invite_code.finish
    fill_in "Start", with: @invite_code.start
    click_on "Update Invite code"

    assert_text "Invite code was successfully updated"
    click_on "Back"
  end

  test "destroying a Invite code" do
    visit invite_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invite code was successfully destroyed"
  end
end
