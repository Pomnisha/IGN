module SettingsHelper
  def resource_name
    :refinery_user
  end

  def resource
    @resource ||= Refinery::User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:refinery_user]
  end
end