#encoding: utf-8
module Refinery
  module Companies
    class Company < Refinery::Core::BaseModel
      self.table_name = 'refinery_companies'

      attr_accessible :url, :name, :short_description, :description, :city, :phone, :working_time, :e_mail, :address, :position,
                      :map_latitude, :map_longtitude, :logo_id, :service_id,:img_uid, :img, :retained_img, :visability, :vip_code
      acts_as_indexed :fields => [:url, :name, :short_description, :description, :city, :phone, :working_time, :address]

#      validates :url, :presence => true, :uniqueness => true
      belongs_to :user, :class_name => "Refinery::User"
      belongs_to :service, :class_name => "Refinery::Services::Service"
      belongs_to :logo, :class_name => '::Refinery::Image'
   
      validates :url, :presence => {:message => "Поле Адрес сайта должно быть заполненным."}
      validates :name, :presence => { :message => "Поле Название магазина должно быть заполненным." }
      validates :short_description, :presence => { :message => "Поле Краткое описание должно быть заполненным."}
      validates :description, :presence => { :message => "Поле Описание должно быть заполненным."}
      validates :service_id, :presence => { :message => "Тип услуг должен быть выбран."}
      validates :city, :presence => {:message => "Поле Город должно быть заполненным."}
      validates :e_mail, :presence => { :message => "Поле Электронный адрес должно быть заполненным."}
      
      image_accessor :img

      def self.search(search)
        if search
          where('name LIKE ? OR short_description LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
        else
          scoped
        end
      end      
      
    end
  end
end
