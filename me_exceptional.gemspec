# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "me_exceptional/version"

Gem::Specification.new do |s|
  s.name        = "me_exceptional"
  s.version     = MeExceptional::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kai Rubarth"]
  s.email       = ["kai@doxter.de"]
  s.homepage    = ""
  s.summary     = %q{notifies you of exceptions by email}
  s.description = %q{The gem catches exceptions and creates and sends emails with backtrace and other informations.}

  s.rubyforge_project = "me_exceptional"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('activesupport')
  s.add_dependency('rails')
  s.add_dependency('geocoder')

end


