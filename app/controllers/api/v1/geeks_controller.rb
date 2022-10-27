class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update, :destroy, :mark_deleted]

  # для выполнения routes с ассоциацией
  def index
    render json: { geeks: Geek.all }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @geek
  end

  def create
    @geek = Geek.new(geek_params)
    if @geek.save
      render json: @geek.as_json, status: :created
    else
      render json: {user: @geek.errors, status: :no_content}
    end
  end

  def update
    if @geek.update(geek_params)
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @geek.destroy
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end

  def mark_deleted
    if @geek.deleted
      puts "deleted: "
      render json: { deleted_job: [], deleted_already: :not_modified,
      }
    else
      @geek.mark_deleted
      render json: { deleted_company: @geek, code: 200, status: :success, }, except: [:created_at, :updated_at]
    end
  end

  private
  def set_geek
    @geek = Geek.find(params[:id])
  end

  def geek_params
    params.permit(:stack, :resume, :name)
  end
end
