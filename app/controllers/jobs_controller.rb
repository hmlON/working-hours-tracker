class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:edit, :update]

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

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to dashboard_path, notice: "Job updated successfuly"
    else
      render :edit
    end
  end

  private

  def set_job
    @job = current_user.job
  end

  def job_params
    params.require(:job).permit(:hours_per_week)
  end
end
