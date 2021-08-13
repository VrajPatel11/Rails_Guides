#Client Side Interactions

#Streams
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end
end
#stream_from is used to subscribe to broadcasting channel chat_Best Room when :room parameter is "Best Room"

class CommentsChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find(params[:id])
    stream_for post
  end
end
#stream_for is used to subscribe a broadcasting like comments:Z2lkOi8vVGVzdEFwcC9Qb3N0LzE, where Z2lk... is the GlobalID of Post model


#Subscription
#the messages sent by the cable consumer are routed to the subscribed channels by the consumer

#// app/javascript/channels/chat_channel.js
#// Assumes you've already requested the right to send web notifications
import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ChatChannel", room: "Best Room" }, {
  received(data) {
    this.appendLine(data)
  },

  appendLine(data) {
    const html = this.createLine(data)
    const element = document.querySelector("[data-chat-room='Best Room']")
    element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return `
      <article class="chat-line">
        <span class="speaker">${data["sent_by"]}</span>
        <span class="body">${data["body"]}</span>
      </article>
    `
  }
})

#we can pass params to channels from client side to server side by
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end
end


#rebroadcasting a message 
#it is used to rebroadcast a message sent by one client to other connected clients
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("chat_#{params[:room]}", data)
  end
end

