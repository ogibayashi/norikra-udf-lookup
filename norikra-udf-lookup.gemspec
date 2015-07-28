# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'norikra/udf/lookup/version'

Gem::Specification.new do |spec|
  spec.name          = "norikra-udf-lookup"
  spec.version       = Norikra::Udf::Lookup::VERSION
  spec.authors       = ["Hironori Ogibayashi"]
  spec.email         = ["ogibayashi@gmail.com"]

  spec.summary       = %q{Norikra UDF to Lookup keys from a table}
  spec.description   = %q{Norikra UDF to Lookup keys from a table}
  spec.homepage      = "https://github.com/ogibayashi"
  spec.platform = "java"
  
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib","jar"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "norikra"
end
