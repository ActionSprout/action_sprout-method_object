# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_sprout/method_object/version'

Gem::Specification.new do |spec|
  spec.name          = "action_sprout-method_object"
  spec.version       = ActionSprout::MethodObject::VERSION
  spec.authors       = ["Amiel Martin"]
  spec.email         = ["amiel@actionsprout.com"]

  spec.summary       = %q{Method objects, the way we do them at ActionSprout}
  spec.description   = %q{A simple class method that makes it super easy to create a method object taking keyword attributes.}
  spec.homepage      = "https://github.com/ActionSprout/action_sprout-method_object"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.add_dependency 'kwattr'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
