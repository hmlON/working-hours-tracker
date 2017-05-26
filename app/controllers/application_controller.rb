class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_job
    authenticate_user!
    redirect_to new_job_path, notice: 'To continue you need to have a job.' unless current_user.job?
  end

  def require_job_absence
    authenticate_user!
    redirect_to dashboard_path, alert: 'You already have a job!.' if current_user.job?
  end
end
