module Refinery
  module Menus
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Menus

      engine_name :refinery_menus

      initializer "register refinerycms_menus plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "menus"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.menus_admin_menus_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/menus/menu',
            :title => 'type'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Menus)
      end
    end
  end
end
