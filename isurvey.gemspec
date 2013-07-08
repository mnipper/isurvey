# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isurvey/version'

Gem::Specification.new do |spec|
  spec.name          = "isurvey"
  spec.version       = Isurvey::VERSION
  spec.authors       = ["Michael Nipper"]
  spec.email         = ["mjn4406@gmail.com"]
  spec.description   = %q{Communicate with the iSurvey SOAP api.}
  spec.summary       = %q{Communicate with the iSurvey SOAP api.}
  spec.homepage      = "http://github.com/mnipper/isurvey"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "savon", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "savon", "~> 2.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"

end
