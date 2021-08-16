# Overview of the I18n API Features

#Looking up Translations
I18n.t :message
I18n.t 'message'
#they are looked up by keys which can be both symbol and string

#it also takes a :scope option
I18n.t :record_invalid, scope: [:activerecord, :errors, :messages]

#key and scopes can be specified as dot-separated keys
I18n.translate "activerecord.errors.messages.record_invalid"


#when default is given its value will be returned incase of no translation
I18n.t :missing, default: 'Not here'
# => 'Not here'


#Arrays of keys can be passed to look up multiple translations
I18n.t [:odd, :even], scope: 'errors.messages'
# => ["must be odd", "must be even"]


#Lazy lookup
es:
  books:
    index:
      title: "Título"

#we can look up books.index.title inside app/views/books/index.html.erb
#<%= t '.title' %>



#Pluralization
I18n.backend.store_translations :en, inbox: {
  zero: 'no messages', # optional
  one: 'one message',
  other: '%{count} messages'
}
I18n.translate :inbox, count: 2
# => '2 messages'

I18n.translate :inbox, count: 1
# => 'one message'

I18n.translate :inbox, count: 0
# => 'no messages'


#setting and passing locale
I18n.locale = :de
I18n.t :foo
I18n.l Time.now
#if no locale is passed I18n.locale is used

#error messages scopes
class User < ApplicationRecord
    validates :name, presence: true
end
#active record will look up this key in namespaces
activerecord.errors.models.[model_name].attributes.[attribute_name]
activerecord.errors.models.[model_name]
activerecord.errors.messages
errors.attributes.[attribute_name]
errors.messages


  