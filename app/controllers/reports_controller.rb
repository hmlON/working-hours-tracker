class ReportsController < ApplicationController
  def index
    sundays = current_user.job.created_at.to_date.upto(Date.today).select(&:sunday?)
    @weeks = sundays.map { |sunday| WorkedWeek.new(job: current_user.job, date: sunday) }
  end
end
