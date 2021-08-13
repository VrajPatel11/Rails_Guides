#How to Load Core Extensions  

#Stand-Alone Active Support

require "active_support"
require "active_support/core_ext/object/blank"
#It is known as cherry picking since any method is blank it reads active_support/core_ext/object/blank.rb

require "active_support"
require "active_support/core_ext/object"
#Load all extensions to Object

require "active_support"
require "active_support/core_ext"
#Load all core extensions

require "active_support/all"
#Load all active support

