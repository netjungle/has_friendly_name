# HasFriendlyName
module HasFriendlyName
  
  def self.included(base)
    base.extend ClassMethods 
  end
  
  module ClassMethods
    # adds friendly_name to your model. Options are:
    # * unique => boolean - should the friendly_name be unique for this model? appends count if name has been taken
    # * to_downcase - friendly_name will be downcased
    # * titelize - friendly_name will be titelized
    def has_friendly_name(options={})
      self.cattr_accessor :has_friendly_name_options
      self.has_friendly_name_options = {:unique => true, :titelize => false, :downcase => true, :from => :name}.merge(options)
      before_create :generate_friendly_name
      include HasFriendlyName::InstanceMethods
    end
    
    def find_by_friendly_name(query)
      obj = find(:first, :conditions => "friendly_name ='#{query}'")
      
      if query.match(/\d+/)
        obj = find(:first, :conditions => "friendly_name = '#{query.gsub(/-\d+/, "")}'") unless obj
        obj = find(:first, :conditions => "friendly_name LIKE '#{query.gsub(/-\d+/, "")}-%'") unless obj
      end
      
        
      raise ActiveRecord::RecordNotFound, "Couldn't find #{name} with friendly_name #{query}" unless obj

      obj
    end
    
  end
  
  module InstanceMethods
    
    
    
    def generate_friendly_name              
      self.friendly_name = send(self.has_friendly_name_options[:from].to_s.to_sym).to_friendly(self.has_friendly_name_options)
      
      if self.has_friendly_name_options[:unique] 
        checkmodel=self.class.find_by_friendly_name(self.friendly_name)          
        if checkmodel and checkmodel!=self
          self.friendly_name+='-'+(self.class.count+1).to_s
        end
      end
          
      self.friendly_name
    end
    
  end
  
end