class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @worked_days_this_week = current_user.job.worked_days.this_week
    @worked_day = WorkedDay.new(hours: current_user.job.hours_per_day.to_i, date: Date.today)
  end
end
