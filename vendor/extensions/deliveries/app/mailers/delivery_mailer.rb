module Refinery
  module Deliveries
    class DeliveryMailer < ActionMailer::Base
      default :from => "admin@ign.su"
  
      def package_to_send(delivery, entity)
        @delivery = delivery
        @entity = entity
        
        mail(:to => entity.email, :subject => delivery.subject, :body => delivery.body)
      end
    end
  end
end