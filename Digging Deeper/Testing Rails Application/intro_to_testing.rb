#Introduction to Testing


#First Failing Test
test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
end
#running this test shows
Failure:
ArticleTest#test_should_not_save_article_without_title [/path/to/blog/test/models/article_test.rb:6]:
Saved the article without a title
#to pass this test we can add model level validation
class Article < ApplicationRecord
    validates :title, presence: true
end
#then the test would pass
$ bin/rails test test/models/article_test.rb:6
Run options: --seed 31252

# Running:

.

Finished in 0.027476s, 36.3952 runs/s, 36.3952 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips


#how does an error look
test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    some_undefined_variable
    assert true
end

$ bin/rails test test/models/article_test.rb
Run options: --seed 1808

# Running:

.E

Error:
ArticleTest#test_should_report_error:
NameError: undefined local variable or method 'some_undefined_variable' for #<ArticleTest:0x007fee3aa71798>
    test/models/article_test.rb:11:in 'block in <class:ArticleTest>'


rails test test/models/article_test.rb:9



Finished in 0.040609s, 49.2500 runs/s, 24.6250 assertions/s.

2 runs, 1 assertions, 0 failures, 1 errors, 0 skips
bin/rails test test/models/article_test.rb

#to run all the tests
bin/rails test test/models/article_test.rb

#to run a particular test method
bin/rails test test/models/article_test.rb -n test_the_truth

#to run entire directory of tests
bin/rails test test/controllers # run all tests from specific directory
