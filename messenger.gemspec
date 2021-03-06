require_relative 'lib/messenger/version'

Gem::Specification.new do |spec|
  spec.name        = 'messenger'
  spec.version     = Messenger::VERSION
  spec.authors     = ['ihortok']
  spec.homepage    = 'https://github.com/ihortok/messenger_rails_engine'
  spec.summary     = 'Simple Messenger'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'devise'
  spec.add_dependency 'elasticsearch-model'
  spec.add_dependency 'elasticsearch-persistence'
  spec.add_dependency 'elasticsearch-rails'
  spec.add_dependency 'faker'
  spec.add_dependency 'pagy'
  spec.add_dependency 'rails', '~> 6.1.4'
end
