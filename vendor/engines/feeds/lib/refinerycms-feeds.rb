require 'refinerycms-base'

module Refinery
  module Feeds
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "feeds"
          plugin.activity = {
            :class => Feed,
            :title => 'name'
          }
        end
      end
    end
  end
end
