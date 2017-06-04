class WorkedWeek
  attr_reader :job, :range

  def initialize(job:, date: Date.today)
    @job = job
    @range = Date.today.beginning_of_week..Date.today.end_of_week
  end

  def worked_days
    worked_days = job.worked_days.where(date: range)
    worked_dates.map do |date| # add empty days
      worked_days.find { |day| day.date == date } || WorkedDay.new(date: date, hours: 0)
    end
  end

  private

  def worked_dates
    job.week_day_numbers.map do |week_day_number|
      range.to_a[week_day_number - 1]
    end
  end
end
