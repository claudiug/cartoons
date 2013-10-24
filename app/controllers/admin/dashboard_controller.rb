class Admin::DashboardController < ApplicationController
  layout "admin"


  def index
   @statistic = Statistic.new
  end

  def statistic

  end
end
