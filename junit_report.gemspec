# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "junit_report/version"

Gem::Specification.new do |s|
  s.name        = "junit_report"
  s.version     = JunitReport::VERSION
  s.authors     = ["Dima Samodurov"]
  s.email       = ["dimasamodurov@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{This gem helps visualising cucumber reports produced by junit formatter}
  s.description = %q{Parses xml files produced by the junit formatter and produce a summary document in html or csv format.}

  s.rubyforge_project = "junit_report"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rake"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "virtus"
  s.add_runtime_dependency "haml"
end
