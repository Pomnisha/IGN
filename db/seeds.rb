# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Categories extension
Refinery::Categories::Engine.load_seed

# Added by Refinery CMS Subcategories extension
Refinery::Subcategories::Engine.load_seed

# Added by Refinery CMS Shops extension
Refinery::Shops::Engine.load_seed

# Added by Refinery CMS Services extension
Refinery::Services::Engine.load_seed

# Added by Refinery CMS Companies extension
Refinery::Companies::Engine.load_seed

# Added by Refinery CMS Banners extension
Refinery::Banners::Engine.load_seed

# Added by Refinery CMS Menus extension
Refinery::Menus::Engine.load_seed

# Added by Refinery CMS Topics extension
Refinery::Topics::Engine.load_seed

# Added by Refinery CMS Posts extension
Refinery::Posts::Engine.load_seed

# Added by Refinery CMS Deliveries extension
Refinery::Deliveries::Engine.load_seed
