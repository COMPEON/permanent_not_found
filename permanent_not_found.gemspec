# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'permanent_not_found/version'

Gem::Specification.new do |spec|
  spec.name          = "permanent_not_found"
  spec.version       = PermanentNotFound::VERSION
  spec.authors       = ["Martin Spickermann", "Timo Schilling"]
  spec.email         = ["spickermann@gmail.com", "timo@schilling.io"]

  spec.summary       = %q{Tiny little Rack middleware to answer a configured set of path's with a HTTP 404.}
  spec.homepage      = "https://github.com/COMPEON/permanent_not_found"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
