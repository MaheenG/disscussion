require_relative "boot"

require "rails/all"
require 'devise' 
Bundler.require(*Rails.groups)

module DiscussionForum
  class Application < Rails::Application
    config.load_defaults 7.0
    
    # CORS configuration for API
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
    
    # Autoload lib directory
    #config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths << Rails.root.join('lib')

  end
end
