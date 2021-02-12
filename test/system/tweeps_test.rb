require "application_system_test_case"

class TweepsTest < ApplicationSystemTestCase
  setup do
    @tweep = tweeps(:one)
  end

  test "visiting the index" do
    visit tweeps_url
    assert_selector "h1", text: "Tweeps"
  end

  test "creating a Tweep" do
    visit tweeps_url
    click_on "New Tweep"

    fill_in "Tweep", with: @tweep.tweep
    click_on "Create Tweep"

    assert_text "Tweep was successfully created"
    click_on "Back"
  end

  test "updating a Tweep" do
    visit tweeps_url
    click_on "Edit", match: :first

    fill_in "Tweep", with: @tweep.tweep
    click_on "Update Tweep"

    assert_text "Tweep was successfully updated"
    click_on "Back"
  end

  test "destroying a Tweep" do
    visit tweeps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tweep was successfully destroyed"
  end
end
