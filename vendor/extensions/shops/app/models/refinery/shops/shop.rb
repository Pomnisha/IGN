#encoding: utf-8
module Refinery
  module Shops
    class Shop < Refinery::Core::BaseModel
      self.table_name = 'refinery_shops'

      attr_accessible :url, :position, :name, :short_description, :description, :working_time, :map_latitude, :map_longtitude, 
                      :subcategory_id, :city, :phone, :e_mail, :logo_id, :vip_code, :logo, :img_uid, :img, :retained_img, :address,
                      :visability
      acts_as_indexed :fields => [:url, :name, :short_description, :description, :city, :phone, :working_time, :address]
      belongs_to :user, :class_name => "Refinery::User"
      belongs_to :subcategory, :class_name => "Refinery::Subcategories::Subcategory"
#      validates :url, :presence => true, :uniqueness => true
      
      validates :url, :presence => {:message => "Поле Адрес сайта должно быть заполненным."}
      validates :name, :presence => { :message => "Поле Название магазина должно быть заполненным." }
      validates :short_description, :presence => { :message => "Поле Краткое описание должно быть заполненным."}
      validates :description, :presence => { :message => "Поле Описание должно быть заполненным."}
      validates :subcategory_id, :presence => { :message => "Категория должна быть выбрана."}
      validates :city, :presence => {:message => "Поле Город должно быть заполненным."}
      validates :e_mail, :presence => { :message => "Поле Электронный адрес должно быть заполненным."}

      belongs_to :logo, :class_name => '::Refinery::Image'
      image_accessor :img
      
      def self.search(search)
        if search
          where('name LIKE ? OR short_description LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
#          find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
        else
          scoped
        end
      end
      
    end
  end
end
