require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { address: @payment.address, card_number: @payment.card_number, cart_id: @payment.cart_id, city: @payment.city, cvv: @payment.cvv, exp_date: @payment.exp_date, name: @payment.name, state: @payment.state, type: @payment.type, user_id: @payment.user_id, zip: @payment.zip }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    patch :update, id: @payment, payment: { address: @payment.address, card_number: @payment.card_number, cart_id: @payment.cart_id, city: @payment.city, cvv: @payment.cvv, exp_date: @payment.exp_date, name: @payment.name, state: @payment.state, type: @payment.type, user_id: @payment.user_id, zip: @payment.zip }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
