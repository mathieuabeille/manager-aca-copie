require "application_system_test_case"

class MaterialCommentsTest < ApplicationSystemTestCase
  setup do
    @material_comment = material_comments(:one)
  end

  test "visiting the index" do
    visit material_comments_url
    assert_selector "h1", text: "Material Comments"
  end

  test "creating a Material comment" do
    visit material_comments_url
    click_on "New Material Comment"

    fill_in "Author", with: @material_comment.author
    fill_in "Comment", with: @material_comment.comment
    fill_in "Material", with: @material_comment.material_id
    click_on "Create Material comment"

    assert_text "Material comment was successfully created"
    click_on "Back"
  end

  test "updating a Material comment" do
    visit material_comments_url
    click_on "Edit", match: :first

    fill_in "Author", with: @material_comment.author
    fill_in "Comment", with: @material_comment.comment
    fill_in "Material", with: @material_comment.material_id
    click_on "Update Material comment"

    assert_text "Material comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Material comment" do
    visit material_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material comment was successfully destroyed"
  end
end
