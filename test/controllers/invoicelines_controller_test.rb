require 'test_helper'

class InvoicelinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoiceline = invoicelines(:one)
  end

  test "should get index" do
    get invoicelines_url
    assert_response :success
  end

  test "should get new" do
    get new_invoiceline_url
    assert_response :success
  end

  test "should create invoiceline" do
    assert_difference('Invoiceline.count') do
      post invoicelines_url, params: { invoiceline: { name: @invoiceline.name, price: @invoiceline.price, quantity: @invoiceline.quantity } }
    end

    assert_redirected_to invoiceline_url(Invoiceline.last)
  end

  test "should show invoiceline" do
    get invoiceline_url(@invoiceline)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoiceline_url(@invoiceline)
    assert_response :success
  end

  test "should update invoiceline" do
    patch invoiceline_url(@invoiceline), params: { invoiceline: { name: @invoiceline.name, price: @invoiceline.price, quantity: @invoiceline.quantity } }
    assert_redirected_to invoiceline_url(@invoiceline)
  end

  test "should destroy invoiceline" do
    assert_difference('Invoiceline.count', -1) do
      delete invoiceline_url(@invoiceline)
    end

    assert_redirected_to invoicelines_url
  end
end
