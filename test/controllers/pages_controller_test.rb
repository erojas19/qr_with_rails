require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get qr_code_download" do
    get pages_qr_code_download_url
    assert_response :success
  end

end
