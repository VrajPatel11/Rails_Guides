#Testing Views

#assert_select is used
assert_select "title", "Welcome to Rails Testing Guide"

#assert_select blocks
assert_select "ul.navigation" do
  assert_select "li.menu_item"
end

#assert_select_email
assert_select_email do
  assert_select "small", "Please click the 'Unsubscribe' link if you want to opt-out."
end
  
