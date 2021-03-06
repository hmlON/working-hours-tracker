class WorkedDaysController < ApplicationController
  before_action :require_job

  def create
    @worked_day = current_user.job.worked_days.build(worked_day_params)
    if @worked_day.save
      redirect_to dashboard_path, notice: 'Saved'
    else
      render 'dashboard/index'
    end
  end

  private

  def worked_day_params
    params.require(:worked_day).permit(:hours, :date)
  end
end
