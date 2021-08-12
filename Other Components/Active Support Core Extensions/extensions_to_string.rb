#Extensions to String

#Safe strings
s = "".html_safe
s.html_safe? # => true

s = "<script>...</script>".html_safe
s.html_safe? # => true
s            # => "<script>...</script>"

def raw(stringish)
    stringish.to_s.html_safe
end
#we can call html_safe using raw method


#remove
"Hello World".remove(/Hello /) # => "World"

#squish
" \n  foo\n\r \t bar \n".squish # => "foo bar"
#it strips whitespaces

#truncate
"Oh dear! Oh dear! I shall be late!".truncate(20)
# => "Oh dear! Oh dear!..."
#it returns copy of its receiver after given length

#truncate_bytes
"👍👍👍👍".truncate_bytes(15, omission: "🖖")
# => "👍👍🖖"

#truncate_words
"Oh dear! Oh dear! I shall be late!".truncate_words(4)
# => "Oh dear! Oh dear!..."
#it returns copy of its receiver after given nu,ber of words


#starts_with? and ends_with?
"foo".starts_with?("f") # => true
"foo".ends_with?("o")   # => true


#indent
"  foo".indent(2)        # => "    foo"
"foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
"foo".indent(2, "\t")    # => "\t\tfoo"


#access

#at
"hello".at(0)  # => "h"
"hello".at(4)  # => "o"
"hello".at(-1) # => "o"
"hello".at(10) # => nil

#from
"hello".from(0)  # => "hello"
"hello".from(2)  # => "llo"
"hello".from(-2) # => "lo"
"hello".from(10) # => nil

#to
"hello".to(0)  # => "h"
"hello".to(2)  # => "hel"
"hello".to(-2) # => "hell"
"hello".to(10) # => "hello"


#Inflections

#pluralize
"table".pluralize     # => "tables"
"ruby".pluralize      # => "rubies"
"equipment".pluralize # => "equipment"

#if count==1 then singular form will be returned else plural form will be returned
"dude".pluralize(0) # => "dudes"
"dude".pluralize(1) # => "dude"
"dude".pluralize(2) # => "dudes"


#singularize
"tables".singularize    # => "table"
"rubies".singularize    # => "ruby"
"equipment".singularize # => "equipment"


#camelize
"product".camelize    # => "Product"
"admin_user".camelize # => "AdminUser"

"visual_effect".camelize(:lower) # => "visualEffect"


#underscore
"Product".underscore   # => "product"
"AdminUser".underscore # => "admin_user"

"Backoffice::Session".underscore # => "backoffice/session"


#titleize
"alice in wonderland".titleize # => "Alice In Wonderland"
"fermat's enigma".titleize     # => "Fermat's Enigma"

#dasherize
"name".dasherize         # => "name"
"contact_data".dasherize # => "contact-data"

#demodulize
"Product".demodulize                        # => "Product"
"Backoffice::UsersController".demodulize    # => "UsersController"
"Admin::Hotel::ReservationUtils".demodulize # => "ReservationUtils"
"::Inflections".demodulize                  # => "Inflections"
"".demodulize                               # => ""

#deconstantize
"Product".deconstantize                        # => ""
"Backoffice::UsersController".deconstantize    # => "Backoffice"
"Admin::Hotel::ReservationUtils".deconstantize # => "Admin::Hotel"

#parameterize
#it normalizes receiver in a way that can be used in URLs
"John Smith".parameterize # => "john-smith"
"Kurt Gödel".parameterize # => "kurt-godel"

"John Smith".parameterize(separator: "_") # => "john\_smith"
"Kurt Gödel".parameterize(separator: "_") # => "kurt\_godel"


#tableize
"Person".tableize      # => "people"
"Invoice".tableize     # => "invoices"
"InvoiceLine".tableize # => "invoice_lines"


#humanize
"name".humanize                         # => "Name"
"author_id".humanize                    # => "Author"
"author_id".humanize(capitalize: false) # => "author"
"comments_count".humanize               # => "Comments count"
"_id".humanize                          # => "Id"

'ssl_error'.humanize # => "SSL error"

#foreign_key
#gives a foreign key column name from a class name
"User".foreign_key           # => "user_id"
"InvoiceLine".foreign_key    # => "invoice_line_id"
"Admin::Session".foreign_key # => "session_id"


#Conversions
"2010-07-27".to_date              # => Tue, 27 Jul 2010
"2010-07-27 23:37:00".to_time     # => 2010-07-27 23:37:00 +0200
"2010-07-27 23:37:00".to_datetime # => Tue, 27 Jul 2010 23:37:00 +0000

