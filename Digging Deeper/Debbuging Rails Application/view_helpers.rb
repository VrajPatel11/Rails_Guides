#View Helpers For Debugging

#debug
<%= debug @article %>
<p>
  <b>Title:</b>
  <%= @article.title %>
</p>
#debug helper will return a <pre> tag and convert the object to YAML format
# --- !ruby/object Article
# attributes:
#   updated_at: 2008-09-05 22:55:47
#   body: It's a very helpful guide for debugging your Rails app.
#   title: Rails debugging guide
#   published: t
#   id: "1"
#   created_at: 2008-09-05 22:55:47
# attributes_cache: {}
# 
# Title: Rails debugging guide


#to_yaml
<%= simple_format @article.to_yaml %>
<p>
  <b>Title:</b>
  <%= @article.title %>
</p>
#calling to_yaml on any objects converts it to YAML
# --- !ruby/object Article
# attributes:
# updated_at: 2008-09-05 22:55:47
# body: It's a very helpful guide for debugging your Rails app.
# title: Rails debugging guide
# published: t
# id: "1"
# created_at: 2008-09-05 22:55:47
# attributes_cache: {}
# 
# Title: Rails debugging guide

#inspect
<%= [1, 2, 3, 4, 5].inspect %>
<p>
  <b>Title:</b>
  <%= @article.title %>
</p>
#it will print object value as a string and will give
[1, 2, 3, 4, 5]

Title: Rails debugging guide
