# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heartcheck/appsignal/version'

Gem::Specification.new do |spec|
  spec.name = 'heartcheck-appsignal'
  spec.version = Heartcheck::Appsignal::VERSION
  spec.required_ruby_version = '>= 1.9'
  spec.authors = ['Locaweb']
  spec.email = ['desenvolvedores@locaweb.com.br']

  spec.summary = 'A Heartcheck plugin for Appsignal'
  spec.homepage = 'https://github.com/p-lambert/heartcheck-appsignal'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'heartcheck', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.3'
end
