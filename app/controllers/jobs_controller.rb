class JobsController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.new
  end

  def create
    @job = current_user.build_job(job_params)
    if @job.save
      redirect_to root_path, notice: 'Job successfuly created.'
    else
      render :new
    end
  end

  def job_params
    params.require(:job).permit(:hours_per_week)
  end
end
