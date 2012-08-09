module RestrictAccessForMemberRole
  def restrict_access_for_member_role
    if current_refinery_user.nil? && home_page? 
      redirect_to main_app.welcome_page_path
    elsif current_refinery_user.nil? &&
      "#{controller_name}##{action_name}" != 'static#welcome' &&
      "#{controller_path}##{action_name}" != 'refinery/users#new' &&
      "#{controller_path}##{action_name}" != 'refinery/users#create' &&
      "#{controller_path}" != 'refinery/sessions' &&
      "#{controller_path}" != 'refinery/passwords'
      redirect_to refinery.new_refinery_user_session_path
    elsif !controller_path.to_s.match('admin').nil? && !current_refinery_user.nil? && !current_refinery_user.has_role?("Superuser")
      redirect_to refinery.root_path
    end
  end
end