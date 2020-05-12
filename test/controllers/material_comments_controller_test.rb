require 'test_helper'

class MaterialCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_comment = material_comments(:one)
  end

  test "should get index" do
    get material_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_material_comment_url
    assert_response :success
  end

  test "should create material_comment" do
    assert_difference('MaterialComment.count') do
      post material_comments_url, params: { material_comment: { author: @material_comment.author, comment: @material_comment.comment, material_id: @material_comment.material_id } }
    end

    assert_redirected_to material_comment_url(MaterialComment.last)
  end

  test "should show material_comment" do
    get material_comment_url(@material_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_comment_url(@material_comment)
    assert_response :success
  end

  test "should update material_comment" do
    patch material_comment_url(@material_comment), params: { material_comment: { author: @material_comment.author, comment: @material_comment.comment, material_id: @material_comment.material_id } }
    assert_redirected_to material_comment_url(@material_comment)
  end

  test "should destroy material_comment" do
    assert_difference('MaterialComment.count', -1) do
      delete material_comment_url(@material_comment)
    end

    assert_redirected_to material_comments_url
  end
end
