module Refinery
  class UsersController < Devise::RegistrationsController

    crudify :'refinery/user',
            :order => 'username ASC',
            :title_attribute => 'username',
            :xhr_paging => true
    
    # Protect these actions behind an admin login
    before_filter :redirect?, :only => [:new, :create]
    before_filter :correct_user, :only => [:edit, :update]
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
#        render :partial => 'refinery/users/success'
        self.deliver_signup_notification
        redirect_to refinery.root_path
#        redirect_back_or_default(refinery.root_path)
#        redirect_back_or_default(refinery.admin_root_path)
      else
        render :partial => 'refinery/users/new'
#        render 'new'
        
      end

    end
    
      def edit
#        redirect_unless_user_editable!
  
#        @selected_plugin_names = @user.plugins.collect(&:name)
      end

     def update
#        redirect_unless_user_editable!

        # Store what the user selected.
        @selected_role_names = params[:user].delete(:roles) || []
        unless current_refinery_user.has_role?(:superuser) and Refinery::Authentication.superuser_can_assign_roles
          @selected_role_names = @user.roles.collect(&:title)
        end
        @selected_plugin_names = params[:user][:plugins]

        # Prevent the current user from locking themselves out of the User manager
        if current_refinery_user.id == @user.id and (params[:user][:plugins].exclude?("refinery_users") || @selected_role_names.map(&:downcase).exclude?("refinery"))
          flash.now[:error] = t('cannot_remove_user_plugin_from_current_user', :scope => 'refinery.admin.users.update')
          render :edit
        else
          # Store the current plugins and roles for this user.
          @previously_selected_plugin_names = @user.plugins.collect(&:name)
          @previously_selected_roles = @user.roles
          @user.roles = @selected_role_names.collect { |r| Refinery::Role[r.downcase.to_sym] }
          if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
            params[:user].except!(:password, :password_confirmation)
          end

          if @user.update_attributes(params[:user])
            redirect_to refinery.admin_users_path,
                        :notice => t('updated', :what => @user.username, :scope => 'refinery.crudify')
          else
            @user.plugins = @previously_selected_plugin_names
            @user.roles = @previously_selected_roles
            @user.save
            render :edit
          end
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
    
    def correct_user
      @user = Refinery::User.find(params[:id])
      redirect_to refinery.root_path if current_refinery_user.id != @user.id
    end
    
    def deliver_signup_notification
      ::UserMailer.signup_notification(current_refinery_user).deliver
    end
    
  end
end
