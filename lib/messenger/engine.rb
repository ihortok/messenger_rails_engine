module Messenger
  class Engine < ::Rails::Engine
    isolate_namespace Messenger

    config.autoload_paths << File.expand_path('../../app/services', __FILE__)

    initializer 'messenger.assets.precompile' do |app|
      app.config.assets.precompile += %w( messenger.js messenger.css )
    end
  end
end
