# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed_ext/version'

Gem::Specification.new do |spec|
  spec.name          = "seed_ext"
  spec.version       = SeedExt::VERSION
  spec.authors       = ["RAWHIDE. Co., Ltd."]
  spec.email         = ["info@raw-hide.co.jp"]
  spec.description   = %q{extract active_record to truncate and seed}
  spec.summary       = %q{extract active_record to truncate and seed}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rails", "~4.0"
end
