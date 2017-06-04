class ReportsController < ApplicationController
  def index
    sundays = Date.today.downto(current_user.job.created_at.to_date).select(&:sunday?)
    @weeks = sundays.map { |sunday| WorkedWeek.new(job: current_user.job, date: sunday) }
  end
end
