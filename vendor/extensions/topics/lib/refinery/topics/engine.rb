module Refinery
  module Topics
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Topics

      engine_name :refinery_topics

      initializer "register refinerycms_topics plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "topics"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.topics_admin_topics_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/topics/topic',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Topics)
      end
    end
  end
end
