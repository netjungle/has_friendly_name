Gem::Specification.new do |s|
  s.name = %q{has_friendly_name}
  s.version = "0.2.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors     = ["Dennis Meise"]
  s.date        = %q{2010-03-17}
  s.summary     = %q{HasFriendlyName adds a search engine friendly name to your active record model.}
  s.homepage = %q{http://www.dennis-meise.de}
  s.email       = %q{gems@dennis-meise.de}
  s.extra_rdoc_files = ["README.md"]
  s.files = %w(
    init.rb
    Rakefile
    README.md
    lib/has_friendly_name.rb
    lib/string_extensions.rb
    lib/active_record_extensions.rb
    rails/init.rb
  )
  s.has_rdoc         = true
  s.rdoc_options     = ["--inline-source", "--charset=UTF-8"]
  s.require_paths    = ["lib"]
  s.rubygems_version = '1.3.0'
  
end