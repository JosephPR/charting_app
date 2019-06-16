class Api::V1::ChartsController < ApplicationController
  before_action :find_chart, only: %i[:update destroy]


  def index
    @charts = Chart.order(name: :DESC)
    render json: @charts
  end

  def create
    @chart = Chart.new(chart_params)
    @chart.save
  end

  def destroy
    @chart.delete
  end


  def update
  @chart.update(params.permit(:name, :image_url))
  end

  private

  def chart_params
    params.permit(:name, :image_url, :user_id)
  end

  def find_chart
    @chart = Chart.find(params[:id])
  end
end
