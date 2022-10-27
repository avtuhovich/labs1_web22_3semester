class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy, :mark_deleted]

  # для выполнения routes с ассоциацией
  def index
    if params[:company_id]
      @jobs = Company.find(params[:company_id]).jobs
    else
      @jobs = Job.all
    end
    render json: { jobs: @jobs }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @job
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job.as_json, status: :created
    else
      render json: {user: @job.errors, status: :no_content}
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @job.destroy
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def mark_deleted
    if @job.deleted
      puts "deleted: "
      render json: { deleted_job: [], deleted_already: :not_modified,
      }
    else
      @job.mark_deleted
      render json: { deleted_company: @job, code: 200, status: :success, }, except: [:created_at, :updated_at]
    end
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.permit(:place, :company_id, :name)
  end
end
