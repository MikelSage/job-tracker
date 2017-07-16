class JobsController < ApplicationController
  def index
    if params[:sort] == 'location'
      @sorted_jobs = Job.sort_by_location
    else
      @job = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)

    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to @company
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
