#Inspecting and Testing Routes

#Listing Existing Routes
bin/rails routes 
#list the complete routes

bin/rails routes --expanded
#to turn on expanded table

bin/rails routes -g new_comment
bin/rails routes -g POST
bin/rails routes -g admin
#to search within the routes use -g option

bin/rails routes -c users
bin/rails routes -c admin/users
bin/rails routes -c Comments
bin/rails routes -c Articles::CommentsController
#to match routes mapping to a specific controller


#Testing routes

#3 built-in assertions for testing routes
assert_generates
assert_recognizes
assert_routing