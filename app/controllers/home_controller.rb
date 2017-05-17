class HomeController < ApplicationController
  def index
    if user_signed_in?
      return redirect_to new_job_path unless current_user.job?
      return redirect_to dashboard_path
    end
  end

  # this is for devise to work on the homepage
  helper_method :resource_name, :resource_class, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource_class
     User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
