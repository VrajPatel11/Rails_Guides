#Extensions to Enumerable

#sum
[1, 2, 3].sum # => 6
(1..100).sum  # => 5050

[[1, 2], [2, 3], [3, 4]].sum    # => [1, 2, 2, 3, 3, 4]
%w(foo bar baz).sum             # => "foobarbaz"
{a: 1, b: 2, c: 3}.sum          # => [:a, 1, :b, 2, :c, 3]

#index_with
post = Post.new(title: "hey there", body: "what's up?")

%i( title body ).index_with { |attr_name| post.public_send(attr_name) }
# => { title: "hey there", body: "what's up?" }

WEEKDAYS.index_with(Interval.all_day)
# => { monday: [ 0, 1440 ], … }

#including
[ 1, 2, 3 ].including(4, 5)                    # => [ 1, 2, 3, 4, 5 ]
["David", "Rafael"].including %w[ Aaron Todd ] # => ["David", "Rafael", "Aaron", "Todd"]

#excluding
["David", "Rafael", "Aaron", "Todd"].excluding("Aaron", "Todd") # => ["David", "Rafael"]

#pluck
[{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name) # => ["David", "Rafael", "Aaron"]
[{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name) # => [[1, "David"], [2, "Rafael"]]

