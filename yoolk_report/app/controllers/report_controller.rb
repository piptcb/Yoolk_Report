class ReportController < ApplicationController
  def index
  end

  def show
    @report_name = params[:id]
    @data = Report.data_for_chart(@report_name)
  end

end
