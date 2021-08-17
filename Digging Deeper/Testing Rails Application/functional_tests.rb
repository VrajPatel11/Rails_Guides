#Functional Tests for controller

#require "test_helper"

#get post patch put head delete are the available request types for funcitonal tests

#testing XHR requests
test "ajax request" do
  article = articles(:one)
  get article_url(article), xhr: true

  assert_equal "hello world", @response.body
  assert_equal "text/javascript", @response.media_type
end

#Three hashes
# cookies - Any cookies that are set, flash - Any objects living in the flash and session - Any object living in session variables  

flash["gordon"]               flash[:gordon]
session["shmession"]          session[:shmession]
cookies["are_good_for_u"]     cookies[:are_good_for_u]

#instance variables
#@controller - The controller processing the request, @request - The request object and @response - The response object
class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url

    assert_equal "index", @controller.action_name
    assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Articles", @response.body
  end
end
  
#setting headers and cgi
# setting an HTTP Header
get articles_url, headers: { "Content-Type": "text/plain" } # simulate the request with custom header

# setting a CGI variable
get articles_url, headers: { "HTTP_REFERER": "http://example.com/home" } # simulate the request with custom env variable

#test for :show action
test "should show article" do
  article = articles(:one)
  get article_url(article)
  assert_response :success
end

#deleting an article
test "should destroy article" do
  article = articles(:one)
  assert_difference("Article.count", -1) do
    delete article_url(article)
  end

  assert_redirected_to articles_path
end

#test for updating an existing article
test "should update article" do
  article = articles(:one)

  patch article_url(article), params: { article: { title: "updated" } }

  assert_redirected_to article_path(article)
  # Reload association to fetch updated data and assert that title is updated.
  article.reload
  assert_equal "updated", article.title
end


#eagerly requiring helpers
# test/test_helper.rb
Dir[Rails.root.join("test", "test_helpers", "**", "*.rb")].each { |file| require file }
#globbing

