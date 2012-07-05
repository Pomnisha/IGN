#!/bin/env ruby
# encoding: utf-8
module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      BANNER_TYPE = [ [1,"Тип 1 – Шапка каталога"],
                      [2,"Тип 2 – Верх контента"],
                      [3,"Тип 3 – Баннеры скроллера"],
                      [4,"Тип 4 – Супер-баннер"],
                      [5,"Тип 5 – Бегущая строка"],
                      [6,"Тип 6 – Шапка макета услуги"],
                      [7,"Тип 7 – скроллер широкий"]]
      self.table_name = 'refinery_banners'

      attr_accessible :banner_type, :name, :url, :image_id, :position
      belongs_to :image, :class_name => '::Refinery::Image'

    end
  end
end
