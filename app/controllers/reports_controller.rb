# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  REPORTS_PER_PAGE_SIZE = 5

  def index
    @reports = Report.order(:created_at, :id).page(params[:page]).per(REPORTS_PER_PAGE_SIZE)
  end

  def show; end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to @report, notice: t('.success')
    else
      render :new, notice: t('.failure')
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('.success')
    else
      render :edit, notice: t('.failure')
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('.success')
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :body, :user_id)
  end
end
