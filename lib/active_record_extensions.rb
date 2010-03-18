module ActiveRecord
  module ConnectionAdapters
    
     class TableDefinition
       
       #erstellt ein friendly_name und name feld
       def name
         column(:name, :string)
         column(:friendly_name, :string)
       end
       
       def default_text
         column(:text, :text)
       end
       
       #erstellt ein feld vom typ integer mit name+_count und default 0
       def count(name)
         column("#{name.to_s}_count", :integer, :default => 0)
       end
       
     end
     
  end
end