require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "creating a Material" do
    visit materials_url
    click_on "New Material"

    fill_in "Company", with: @material.company
    fill_in "Id", with: @material.id
    fill_in "Invoice", with: @material.invoice
    fill_in "Location", with: @material.location
    fill_in "Name", with: @material.name
    fill_in "Serial", with: @material.serial
    fill_in "Supplier", with: @material.supplier
    fill_in "Type", with: @material.type
    click_on "Create Material"

    assert_text "Material was successfully created"
    click_on "Back"
  end

  test "updating a Material" do
    visit materials_url
    click_on "Edit", match: :first

    fill_in "Company", with: @material.company
    fill_in "Id", with: @material.id
    fill_in "Invoice", with: @material.invoice
    fill_in "Location", with: @material.location
    fill_in "Name", with: @material.name
    fill_in "Serial", with: @material.serial
    fill_in "Supplier", with: @material.supplier
    fill_in "Type", with: @material.type
    click_on "Update Material"

    assert_text "Material was successfully updated"
    click_on "Back"
  end

  test "destroying a Material" do
    visit materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material was successfully destroyed"
  end
end
