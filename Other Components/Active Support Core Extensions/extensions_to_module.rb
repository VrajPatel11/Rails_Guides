#Extensions To Module

#Attributes


class User < ApplicationRecord
    # You can refer to the email column as "login".
    # This can be meaningful for authentication code.
    alias_attribute :login, :email
end
#alias_attribute

# library
class ThirdPartyLibrary::Crawler
    attr_internal :log_level
end

# client code
class MyCrawler < ThirdPartyLibrary::Crawler
  attr_accessor :log_level
end
#internal atributes
#if log_level doesnote belong to public interface of library and the client code is unaware of conflict, but there's no collision because of attr_internal

module ActiveSupport
  module Dependencies
    mattr_accessor :warnings_on_first_load
    mattr_accessor :history
    mattr_accessor :loaded
    mattr_accessor :mechanism
    mattr_accessor :load_paths
    mattr_accessor :load_once_paths
    mattr_accessor :autoloaded_constants
    mattr_accessor :explicitly_unloadable_constants
    mattr_accessor :constant_watch_stack
    mattr_accessor :constant_watch_stack_mutex
  end
end
#module attributes


#Parents

module X
  module Y
    module Z
    end
  end
end
M = X::Y::Z

X::Y::Z.module_parent # => X::Y
M.module_parent       # => X::Y
#module_parent


#Anonymous

module M
end
M.name # => "M"

N = Module.new
N.name # => "N"

Module.new.name # => nil


#check whether anonymous or not
module M
end
M.anonymous? # => false

Module.new.anonymous? # => true


#Method Delegation

class User < ApplicationRecord
    has_one :profile
  
    def name
      profile.name
    end
end
#after using delegate   
class User < ApplicationRecord
    has_one :profile
  
    delegate :name, to: :profile
end


delegate :name, to: :profile, allow_nil: true
#the user.name returns nil if no user


class User < ApplicationRecord
    has_one :profile
  
    delegate_missing_to :profile
end
#delegate_missing_to


  