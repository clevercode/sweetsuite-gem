# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sweet_suite/version"

Gem::Specification.new do |s|
  s.name        = "sweetsuite"
  s.version     = SweetSuite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrew Smith']
  s.email       = ['andrew@clevercode.net']
  s.homepage    = "http://clevercode.codebasehq.com/sweetsuite"
  s.summary     = %q{SweetSuite API}
  s.description = %q{Apparently it does some cool things for us}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
 
  s.add_runtime_dependency 'rails', '~> 3.0.7'
  s.add_runtime_dependency 'thor'
  s.add_runtime_dependency 'warden'
  s.add_runtime_dependency 'omniauth', '~> 0.2.4'
end
