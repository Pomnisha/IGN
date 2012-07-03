module Refinery
  class SessionsController < Devise::SessionsController
    helper Refinery::Core::Engine.helpers
    layout 'refinery/layouts/login'

    before_filter :clear_unauthenticated_flash, :only => [:new]
    
    def create
      resource = warden.authenticate!(auth_options)
#      resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => '/'
#      render :partial => "success"
#      return render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'success')}
      rescue ::BCrypt::Errors::InvalidSalt, ::BCrypt::Errors::InvalidHash
      flash[:error] = t('password_encryption', :scope => 'refinery.users.forgot')
      redirect_to refinery.new_refinery_user_password_path
#      render :partial => "new"
#      return render:json => {:success => false, :errors => ["Login failed."]}
    end
 
#  def create
#    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
#    sign_in(resource_name, resource)
#    return render :json => {:success => true}
#  end

#  def failure
#    return render:json => {:success => false, :errors => ["Login failed."]}
#  end
  
  protected

    # We don't like this alert.
    def clear_unauthenticated_flash
      if flash.keys.include?(:alert) and flash.any?{|k, v|
        ['unauthenticated', t('unauthenticated', :scope => 'devise.failure')].include?(v)
      }
        flash.delete(:alert)
      end
    end

  end
end
