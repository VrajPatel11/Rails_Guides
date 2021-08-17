#Testing Action Cable

#connection test case
class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with params" do
    # Simulate a connection opening by calling the `connect` method
    connect params: { user_id: 42 }

    # You can access the Connection object via `connection` in tests
    assert_equal connection.user_id, "42"
  end

  test "rejects connection without params" do
    # Use `assert_reject_connection` matcher to verify that
    # connection is rejected
    assert_reject_connection { connect }
  end
end
  
#channel test case
require "test_helper"

class ChatChannelTest < ActionCable::Channel::TestCase
  test "subscribes and stream for room" do
    # Simulate a subscription creation by calling `subscribe`
    subscribe room: "15"

    # You can access the Channel object via `subscription` in tests
    assert subscription.confirmed?
    assert_has_stream "chat_15"
  end
end

#custom assertions and testing broadcasts inside components
require "test_helper"

class ProductTest < ActionCable::TestCase
  test "broadcast status after charge" do
    assert_broadcast_on("products:#{product.id}", type: "charged") do
      product.charge(account)
    end
  end
end
