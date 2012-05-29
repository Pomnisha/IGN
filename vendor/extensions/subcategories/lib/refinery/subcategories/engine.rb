module Refinery
  module Subcategories
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Subcategories

      engine_name :refinery_subcategories

      initializer "register refinerycms_subcategories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "subcategories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.subcategories_admin_subcategories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/subcategories/subcategory',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Subcategories)
      end
    end
  end
end
