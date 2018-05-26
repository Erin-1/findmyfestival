require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get status:string" do
    get bookings_status:string_url
    assert_response :success
  end

  test "should get total_price:string" do
    get bookings_total_price:string_url
    assert_response :success
  end

  test "should get start_date:datetime" do
    get bookings_start_date:datetime_url
    assert_response :success
  end

  test "should get end_date:datetime" do
    get bookings_end_date:datetime_url
    assert_response :success
  end

  test "should get festival:references" do
    get bookings_festival:references_url
    assert_response :success
  end

  test "should get user:references" do
    get bookings_user:references_url
    assert_response :success
  end

end
