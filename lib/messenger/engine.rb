module Messenger
  class Engine < ::Rails::Engine
    isolate_namespace Messenger

    initializer "messenger.assets.precompile" do |app|
      app.config.assets.precompile += %w( messenger.js messenger.css )
    end
  end
end
