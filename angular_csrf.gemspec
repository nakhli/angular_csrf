# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'version'

Gem::Specification.new do |s|
  s.name = 'angular_csrf'
  s.version = AngularCsrf::VERSION
  s.license = 'MIT'

  s.authors = ['Chaker Nakhli']
  s.email = ['chaker.nakhli@sinbadsoft.com']

  s.files = Dir.glob('{bin,lib}/**/*') + %w(Rakefile README.md)
  s.test_files = Dir.glob('spec/**/*')
  s.homepage = 'http://github.com/sinbadsoft/angular_csrf'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = 'Add support for AngularJS clients to Rails CSRF protection'
  s.description = 'Adapt CSRF protection in Rails applications and webservices to handle AngularJS clients.'

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency 'rails', '>= 3.1'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'rspec-rails', '~> 3.1'

end
