module Refinery
  module Shops
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Shops

      engine_name :refinery_shops

      initializer "register refinerycms_shops plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "shops"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.shops_admin_shops_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/shops/shop',
            :title => 'url'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Shops)
      end
    end
  end
end
