module RestrictAccessForMemberRole
  def restrict_access_for_member_role
#    redirect_to welcome_page_path if !(current_user.try(:has_role? => "Member"))
    if current_refinery_user.nil? && home_page? 
      redirect_to main_app.welcome_page_path
    elsif current_refinery_user.nil? &&
      "#{controller_name}##{action_name}" != 'static#welcome' &&
      "#{controller_path}##{action_name}" != 'refinery/users#new' &&
      "#{controller_path}##{action_name}" != 'refinery/users#create' &&
      "#{controller_path}" != 'refinery/sessions' &&
      "#{controller_path}" != 'refinery/passwords'
      redirect_to refinery.new_refinery_user_session_path
#    elsif 
#    if 
# !controller_path.to_s.match('admin').nil? && !current_refinery_user.nil? && !current_refinery_user.has_role?("Refinery")
#      redirect_to refinery.root_path
    end
#    flash[:notice]="Please become a member with us before accessing the blog."
     #or some other destination path that exists
  end
end