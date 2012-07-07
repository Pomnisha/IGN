module Refinery
  class UsersController < Devise::RegistrationsController

    # Protect these actions behind an admin login
    before_filter :redirect?, :only => [:new, :create]

    helper Refinery::Core::Engine.helpers
    layout 'refinery/layouts/login'

    def new
      @user = User.new
    end

    # This method should only be used to create the first Refinery user.
    
    def create
      @user = User.new(params[:user])
      @user.add_role("Member")
    
      if @user.save
        flash[:message] = "<h2>#{t('welcome', :scope => 'refinery.users.create', :who => @user.username).gsub(/\.$/, '')}.</h2>".html_safe

        sign_in(@user)
        render :partial => 'refinery/user/success'
#        redirect_back_or_default(refinery.root_path)
#        redirect_back_or_default(refinery.admin_root_path)
      else
        render :partial => 'refinery/user/new'
#        render 'new'
        
      end

    end

    protected

    def redirect?
      if refinery_user?
        redirect_to refinery.admin_users_path
      end
    end

    def refinery_users_exist?
      Refinery::Role[:refinery].users.any?
    end

  end
end
