$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "rayt/constants"

Gem::Specification.new do |s|
  s.name = "rayt"
  s.version = Rayt::VERSION
  s.authors = ["Thomas Feron"]
  s.description = "Ruby As You Talk"
  s.summary = "rayt-#{s.version}"
  s.email = "tho.feron@gmail.com"
  s.homepage = "http://www.lf-creation.com"

  s.platform = Gem::Platform::RUBY

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"

  s.files = `git ls-files`.split("\n").reject { |path| path =~ /\.gitignore$/ }
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_path = "lib"
end
