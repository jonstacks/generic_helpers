# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generic_helpers/version'

Gem::Specification.new do |s|
  s.name        = 'generic_helpers'
  s.version     = GenericHelpers::VERSION
  s.summary     = 'DSL for building Rails helper classes to simplify views.'
  s.description = 'DSL for building Rails helper classes to simplify views.'

  s.required_ruby_version = '>= 1.9.3'

  s.license = 'MIT'

  s.author   = 'Jonathan Stacks'
  s.email    = 'jonstacks13@gmail.com'
  s.homepage = 'https://github.com/jonstacks/generic_helpers'

  s.files = Dir['CHANGELOG.md', 'LICENSE', 'README.md', 'lib/**/*']
  s.require_path = 'lib'

  s.add_dependency 'activesupport', '~> 4.2'
end
