# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aislefinder/version"

Gem::Specification.new do |s|

  s.add_dependency "diff-lcs", "1.1.3"
  s.add_dependency "mime-types", "1.17.2"
  s.add_dependency "nokogiri", "1.5.0"
  s.add_dependency "rspec", "2.8.0"
  s.add_dependency "rspec-core", "~> 2.8.0"
  s.add_dependency "rspec-expectations", "~> 2.8.0"
  s.add_dependency "rspec-mocks", "~> 2.8.0"
  s.add_dependency "rspec-core", "2.8.0"
  s.add_dependency "rspec-expectations", "2.8.0"
  s.add_dependency "diff-lcs", "~> 1.1.2"
  s.add_dependency "rspec-mocks", "2.8.0"
  s.add_dependency "typhoeus", "0.3.3"
  s.add_dependency "mime-types"

  s.name        = "aislefinder"
  s.version    = AisleFinder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wavell Watson"]
  s.email       = ["wavel.watson@gmail.com"]
  s.homepage    = "https://github.com/wavell/aislefinder"
  s.summary     = %q{Installs client for the aislefinder api.}
  s.description = %q{Allows you to find the aisle for groceries per your local super market.}
  s.license     = "MIT"
  s.rubyforge_project = "aislefinder"

  s.files         = `git ls-files`.split("\n")  
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/aislefinder`.split("\n").map{ |f| File.basename(f) }   
  s.require_paths = ["lib"]
end
