#Setup the Rails Application for Internationalization

#to change default locale and change translations load path
config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
config.i18n.default_locale = :de


#setting locale from domain name
around_action :switch_locale

def switch_locale(&action)
  locale = extract_locale_from_tld || I18n.default_locale
  I18n.with_locale(locale, &action)
end

# Get locale from top-level domain or return +nil+ if such locale is not available
# You have to put something like:
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# in your /etc/hosts file to try this out locally
def extract_locale_from_tld
  parsed_locale = request.host.split('.').last
  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
end


#every helper on url_for will automatically include local in the query string after
# app/controllers/application_controller.rb
def default_url_options
    { locale: I18n.locale }
end



# config/routes.rb
scope "/:locale" do
    resources :books
end
#after calling books_path we get "/en/books" as default local and http://localhost:3001/nl/books would return Dutch local


  