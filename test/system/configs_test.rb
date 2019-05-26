require "application_system_test_case"

class ConfigsTest < ApplicationSystemTestCase
  setup do
    @config = configs(:one)
  end

  test "visiting the index" do
    visit configs_url
    assert_selector "h1", text: "Configs"
  end

  test "creating a Config" do
    visit configs_url
    click_on "New Config"

    fill_in "User", with: @config.user_id
    click_on "Create Config"

    assert_text "Config was successfully created"
    click_on "Back"
  end

  test "updating a Config" do
    visit configs_url
    click_on "Edit", match: :first

    fill_in "User", with: @config.user_id
    click_on "Update Config"

    assert_text "Config was successfully updated"
    click_on "Back"
  end

  test "destroying a Config" do
    visit configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Config was successfully destroyed"
  end
end
