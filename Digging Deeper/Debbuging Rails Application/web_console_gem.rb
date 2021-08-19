#Debugging with the web-console gem

#console
#we can call the console by console method
class PostsController < ApplicationController
  def new
    console
    @post = Post.new
  end
end
#or in view
<% console %>

<h2>New Post</h2>

#settings
#config.web_console.allowed_ips: Authorized list of IPv4 or IPv6 addresses and networks (defaults: 127.0.0.1/8, ::1).
#config.web_console.whiny_requests: Log a message when a console rendering is prevented (defaults: true).

