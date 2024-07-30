class WorksController < ApplicationController
  before_action :authenticate_user!

  def index
    @work = Work.new
  end

  def create
    @work = current_user.works.new(work_params)
    if @work.save
      redirect_to root_path
    else
      Rails.logger.debug(@work.errors.full_messages)
      render :index
    end
  end

  

  private

  def work_params
    params.require(:work).permit(:place)
  end

end
