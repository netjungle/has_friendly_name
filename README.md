Digineo HasFriendlyName gem
=========

## Description
  HasFriendlyName adds a search engine friendly name to your active record model.
  It also extends the String class with a "to_friendly" method

## Installation:
add the following to your config/enviroment.rb

  config.gem "has_friendly_name"


## Add friendly_name column to your model
  
## Examples & usage

### add an unique friendly_name to your model
  If your user model has a name method and you want an unique friendly_name just use:
    
    class User < ActiveRecord::Base  
      has_friendly_name
    end
  
  first record with name *myStylish~Name* gets the following friendly_name: *mystylish-name*
  
  the second record with the same name gets the following friendly_name: *mystylish-name-2*

### customize
  HasFriendlyName comes with serveal configuration options:
  
    class User < ActiveRecord::Base  
      has_friendly_name(:unique => false, :from => :title, :downcase => false, :titelize => true, :seperator => "_")
    end
  
  first record with name *myStylish~Name* gets the following friendly_name: *MyStylish_Name*
  
  the second record with the same name gets the same because unique is false

Copyright (c) 2010 Dennis Meise , released under the MIT license

