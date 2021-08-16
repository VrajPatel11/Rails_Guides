# Internationalization and Localization


#Abstracting localized code
# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    flash[:notice] = t(:hello_flash)
  end
end
  
#<!-- app/views/home/index.html.erb -->
#<h1><%= t :hello_world %></h1>
#<p><%= flash[:notice] %></p>

#an error message  that the translations for the keys :hello_world and :hello_flash are missing.


#Providing translations
# config/locales/en.yml
en:
  hello_world: Hello world!
  hello_flash: Hello flash!
# config/locales/pirate.yml
pirate:
  hello_world: Ahoy World
  hello_flash: Ahoy Flash

#if translations are stored in YAML files, certain keys must be escaped
# config/locales/en.yml
en:
  success:
    'true':  'True!'
    'on':    'On!'
    'false': 'False!'
  failure:
    true:    'True!'
    off:     'Off!'
    false:   'False!'

I18n.t 'success.true'  # => 'True!'
I18n.t 'success.on'    # => 'On!'
I18n.t 'success.false' # => 'False!'
I18n.t 'failure.false' # => Translation Missing
I18n.t 'failure.off'   # => Translation Missing
I18n.t 'failure.true'  # => Translation Missing

#passing variables to translations
#<!-- app/views/products/show.html.erb -->
#<%= "#{t('currency')}#{@product.price}" %>
# config/locales/en.yml
en:
  currency: "$"
# config/locales/es.yml
es:
  currency: "€"
#If the product's price is 10 then the proper translation for Spanish is "10 €" instead of "€10" but the abstraction cannot give it

#for proper abstraction, there is a feature called variable interpolation
