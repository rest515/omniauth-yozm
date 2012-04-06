# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-yozm/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-yozm"
  s.version     = Omniauth::Yozm::VERSION
  s.authors     = ["MunShik JEONG, Ohyeon KWEON"]
  s.email       = ["ruseel@gmail.com, rest515@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Omniauth strategy for yozm }
  s.description = %q{Omniauth strategy for yozm }

  s.rubyforge_project = "omniauth-yozm"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "omniauth-oauth"
  s.add_runtime_dependency "multi_json"
end
