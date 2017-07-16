class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_location
    locations = Job.pluck(:city).uniq

    jobs_by_city = locations.reduce({}) do |jobs, city|
      jobs[city] = Job.where(city: city)
      jobs
    end
  end
end
