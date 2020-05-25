require "application_system_test_case"

class InvoicelinesTest < ApplicationSystemTestCase
  setup do
    @invoiceline = invoicelines(:one)
  end

  test "visiting the index" do
    visit invoicelines_url
    assert_selector "h1", text: "Invoicelines"
  end

  test "creating a Invoiceline" do
    visit invoicelines_url
    click_on "New Invoiceline"

    fill_in "Name", with: @invoiceline.name
    fill_in "Price", with: @invoiceline.price
    fill_in "Quantity", with: @invoiceline.quantity
    click_on "Create Invoiceline"

    assert_text "Invoiceline was successfully created"
    click_on "Back"
  end

  test "updating a Invoiceline" do
    visit invoicelines_url
    click_on "Edit", match: :first

    fill_in "Name", with: @invoiceline.name
    fill_in "Price", with: @invoiceline.price
    fill_in "Quantity", with: @invoiceline.quantity
    click_on "Update Invoiceline"

    assert_text "Invoiceline was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoiceline" do
    visit invoicelines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoiceline was successfully destroyed"
  end
end
