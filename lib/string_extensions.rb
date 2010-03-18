class String
  
  def to_friendly(given_options={})
    options = {:seperator => "-", :downcase => true, :titleize => false}.merge(given_options)
    res = self    
    res = res.titleize if options[:titleize]
    res = res.gsub(/'/, "").gsub(/\W+/, " ").gsub(/\s\s*/, " ").strip.gsub(/\s/, options[:seperator])
    res.gsub!(/ß/u, 'ss')
    res.gsub!(/[ü]/u, 'ue')
    res.gsub!(/«/, '')
    res.gsub!(/»/, '')
    res.gsub!(/[ä]/u, 'ae')
    res.gsub!(/[ö]/u, 'oe')
    res.gsub!(/ó/, 'o')    
    res.gsub!(/Ä/u, 'ae')
    res.gsub!(/Ö/u, 'Oe')
    res.gsub!(/Ü/u, 'Ue')
    
    res.gsub!(/é/u, 'e')
    res.gsub!(/è/u, 'e')
    res.gsub!(/ê/u, 'e')
    res.gsub!(/É/u, 'e')
    res.gsub!(/È/u, 'e')
    res.gsub!(/Ê/u, 'e')
    
    res.gsub!(/á/u, 'a')
    res.gsub!(/à/u, 'a')
    res.gsub!(/â/u, 'a')
    res.gsub!(/Á/u, 'a')
    res.gsub!(/À/u, 'a')
    res.gsub!(/Â/u, 'A')
    
    res.gsub!(/ú/u, 'u')
    res.gsub!(/ù/u, 'u')
    res.gsub!(/û/u, 'u')
    res.gsub!(/Ú/u, 'u')
    res.gsub!(/Ù/u, 'u')
    res.gsub!(/Û/u, 'u')
    
    res.gsub!(/í/u, 'i')
    res.gsub!(/ì/u, 'i')
    res.gsub!(/î/u, 'i')
    res.gsub!(/Ì/u, 'i')
    res.gsub!(/Í/u, 'i')
    res.gsub!(/Î/u, 'i')
    res.gsub!(/[^a-z^0-9^-^ ]+/i, options[:seperator])
    options[:downcase] ? res.downcase : res
  end
  
end