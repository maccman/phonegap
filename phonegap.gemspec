# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "phonegap/version"

Gem::Specification.new do |s|
  s.name        = "phonegap"
  s.version     = PhoneGap::VERSION
  s.authors     = ["Alex MacCaw"]
  s.email       = ["maccman@gmail.com"]
  s.homepage    = "http://github.com/maccman/phonegap"
  s.summary     = %q{Generate PhoneGap applications from the command-line}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.executables   = ["phonegap"]
end
