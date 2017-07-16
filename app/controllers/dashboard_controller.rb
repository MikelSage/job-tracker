class DashboardController < ApplicationController
  def index
    @interest_count = Job.count_by_interest
  end
end
