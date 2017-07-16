class DashboardController < ApplicationController
  def index
    @interest_count = Job.count_by_interest
    @top_companies = Job.top_companies
  end
end
