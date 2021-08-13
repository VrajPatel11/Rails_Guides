#Configurations

#Subscription Adapter
development:
  adapter: async

test:
  adapter: async

production:
  adapter: redis
  url: redis://10.10.3.153:6381
  channel_prefix: appname_production

#Allowed Request Origins
config.action_cable.allowed_request_origins = ['https://rubyonrails.com', %r{http://ruby.*}]
#action cable only accept req from specified origins that are passed to server config as an array

config.action_cable.disable_request_forgery_protection = true
#to disable allow requests


#Client side logging
#it is disable by default, we can enable it by
import * as ActionCable from '@rails/actioncable'

ActionCable.logger.enabled = true
