#Extensions to All Objects

# blank? and presence?
def authenticate(controller, &login_procedure)
    token, options = token_and_options(controller.request)
    unless token.blank?
      login_procedure.call(token, options)
    end
end
#it checks whether a token is present 
def set_conditional_cache_control!
    return if self["Cache-Control"].present?
    # ...
end
# present? methos can be used instead of blank?


#presence
host = config[:host].presence || 'localhost'
#returns receiver if present

#duplicable?
"foo".dup           # => "foo"
"".dup              # => ""
Rational(1).dup     # => (1/1)
Complex(0).dup      # => (0+0i)
1.method(:+).dup    # => TypeError (allocator undefined for Method)


#deep_dup
array     = ['string']
duplicate = array.dup

duplicate.push 'another-string'

# the object was duplicated, so the element was added only to the duplicate
array     # => ['string']
duplicate # => ['string', 'another-string']

duplicate.first.gsub!('string', 'foo')

# first element was not duplicated, it will be changed in both arrays
array     # => ['foo']
duplicate # => ['foo', 'another-string']

#for getting deep copy of an object use:-
array     = ['string']
duplicate = array.deep_dup

duplicate.first.gsub!('string', 'foo')

array     # => ['string']
duplicate # => ['foo']


#try
# without try
unless @number.nil?
    @number.next
end

# with try
@number.try(:next)


#it can also be extecuted as a block
@person.try { |p| "#{p.first_name} #{p.last_name}" }

@number.try(:nest)  # => nil
@number.try!(:nest) # NoMethodError: undefined method `nest' for 1:Integer


# acts_like?(duck)
def acts_like_string?
end


#to_param
7.to_param # => "7"
#by default to_param calls to_s

[0, true, String].to_param # => "0/true/String"


#to_query
class User
    def to_param
      "#{id}-#{name.parameterize}"
    end
end
#we get a query string with a given key with return value of to_param
current_user.to_query('user') # => "user=357-john-smith"


[3.4, -45.6].to_query('sample')
# => "sample%5B%5D=3.4&sample%5B%5D=-45.6"

{c: 3, b: 2, a: 1}.to_query # => "a=1&b=2&c=3"


#with_options
class Account < ApplicationRecord
    has_many :customers, dependent: :destroy
    has_many :products,  dependent: :destroy
    has_many :invoices,  dependent: :destroy
    has_many :expenses,  dependent: :destroy
end
#we can use with_options method for gettting rid of duplication
class Account < ApplicationRecord
    with_options dependent: :destroy do |assoc|
      assoc.has_many :customers
      assoc.has_many :products
      assoc.has_many :invoices
      assoc.has_many :expenses
    end
end
  

#in?
1.in?([1,2])        # => true
"lo".in?("hello")   # => true
25.in?(30..50)      # => false
1.in?(1)            # => ArgumentError

  