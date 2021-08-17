#Integration testing

#used to test how various parts of our application interact
bin/rails generate integration_test user_flows
#exists  test/integration/
#create  test/integration/user_flows_test.rb

#will generate
require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end

#implementing an integration test
bin/rails generate integration_test blog_flow

#writing an assertion
require "test_helper"

class BlogFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Welcome#index"
  end
end
