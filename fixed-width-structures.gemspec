# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fixed-width-structures/version"

Gem::Specification.new do |s|
  s.name        = "fixed-width-structures"
  s.version     = FixedWidthStructure::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Clive Crous"]
  s.email       = ["clive@crous.co.za"]
  s.homepage    = "http://www.darkarts.co.za/fixed-width-structures"
  s.summary     = %q{Simplify usage of fixed width text based data structures}
  s.description = %q{Simplify usage of fixed width text based data structures as one generally finds used in older apps written in languages like COBOL}

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake", [">= 0.8.7","< 0.9.0"]
  s.add_development_dependency "rspec", ">= 1.3.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
