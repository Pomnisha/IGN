module Refinery
  module Deliveries
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Deliveries

      engine_name :refinery_deliveries

      initializer "register refinerycms_deliveries plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "deliveries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.deliveries_admin_deliveries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/deliveries/delivery',
            :title => 'entity'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Deliveries)
      end
    end
  end
end
