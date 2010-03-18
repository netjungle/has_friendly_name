# Include hook code here
require 'active_record_extensions'
require 'string_extensions'
require 'has_friendly_name'
ActiveRecord::Base.send(:include, HasFriendlyName)