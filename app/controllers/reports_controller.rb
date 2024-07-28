class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @reports = Report.where(user_id: current_user.id).order(created_at: :desc)
    @reports = current_user.reports.order(created_at: :desc)
  end

  def new
    @report = Report.new
    @report.user_id = current_user.id

    # 直近のworkを取得（適宜修正が必要）
    @latest_work = Work.where(user_id: current_user.id).order(created_at: :desc).first
    @report.work_id = @latest_work&.id
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id # ここで user_id を設定

    # 直近のworkを取得（適宜修正が必要）
    @latest_work = Work.where(user_id: current_user.id).order(created_at: :desc).first
    @report.work_id = @latest_work&.id

    if @report.save
      redirect_to reports_path, notice: 'Report was successfully created.'
    else
      render :new
    end
    # @report = Report.new(report_params)
    # if @report.save
    #   redirect_to reports_path
    #   binding.pry
    # else
    #   render :new
    # end
  end

  private

  def report_params
    params.require(:report).permit(:user_id, :work_id, :negotiation, :negotiation_obtain, :negotiation_lost, :introspection)
  end
end
