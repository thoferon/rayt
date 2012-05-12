$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "rays/constants"

Gem::Specification.new do |s|
  s.name = "rays"
  s.version = Rays::VERSION
  s.authors = ["Thomas Feron"]
  s.description = "Ruby As You Speak"
  s.summary = "rays-#{s.version}"
  s.email = "tho.feron@gmail.com"
  s.homepage = "http://www.lf-creation.com"

  s.platform = Gem::Platform::RUBY

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"

  s.files = `git ls-files`.split("\n").reject { |path| path =~ /\.gitignore$/ }
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_path = "lib"
end