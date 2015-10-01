# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imsg/version'

Gem::Specification.new do |spec|
  spec.name          = "imsg"
  spec.version       = Imsg::VERSION
  spec.authors       = ["Matt Petty"]
  spec.email         = ["matt@kizmeta.com"]

  spec.summary       = "Command line tool to send iMessage."
  spec.description   = "Command line tool to send iMessage."
  spec.homepage      = "https://github.com/lodestone/imsg"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.3'
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
end
