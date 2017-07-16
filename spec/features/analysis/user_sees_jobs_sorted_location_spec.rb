require 'rails_helper'

RSpec.feature 'User gives a location to sort by' do
  scenario 'and sees all Jobs sorted by location' do
    company = create(:company, :with_jobs)
    job = company.jobs.first
    create_list(:job, 2, city: job.city)

    visit '/jobs/?sort=location'

    expect(page).to have_content 'All Jobs Sorted By Location'
    expect(page).to have_content job.city
    expect(page).to have_content job.title
    expect(job.city).to appear_before job.title
  end
end
