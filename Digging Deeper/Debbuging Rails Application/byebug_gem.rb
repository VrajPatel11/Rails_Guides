#Debugging with the byebug gem

#setup
gem install byebug
#we can invoke the debugger by using byebug method
class PeopleController < ApplicationController
  def new
    byebug
    @person = Person.new
  end
end

#the shell
#when our app calls byebug method, debugger will be started in a debugger shell
[1, 10] in /PathTo/project/app/controllers/articles_controller.rb
    3:
    4:   # GET /articles
    5:   # GET /articles.json
    6:   def index
    7:     byebug
=>  8:     @articles = Article.find_recent
    9:
   10:     respond_to do |format|
   11:       format.html # index.html.erb
   12:       format.json { render json: @articles }

(byebug)
#if we got there by a browser request then the browser will freeze untill the debugger has finished

