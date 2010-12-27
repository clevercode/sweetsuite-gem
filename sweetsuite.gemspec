# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sweet_suite/version"

Gem::Specification.new do |s|
  s.name        = "sweet_suite"
  s.version     = SweetSuite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrew Smith']
  s.email       = ['andrew@clevercode.net']
  s.homepage    = "http://clevercode.codebasehq.com/sweetsuite"
  s.summary     = %q{SweetSuite API}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "sweet_suite"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
 
  s.add_runtime_dependency 'rails', '~> 3.0.3'
  s.add_runtime_dependency 'warden'
  s.add_runtime_dependency 'omniauth'
end
