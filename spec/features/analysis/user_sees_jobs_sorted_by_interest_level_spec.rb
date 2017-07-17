require 'rails_helper'

RSpec.feature 'User chooses to sort by interest level' do
  scenario 'add they see a page with jobs sorted by interest level' do
    company = create(:company, :with_jobs)
    job = company.jobs.first
    create_list(:job, 2, level_of_interest: job.level_of_interest)

    visit '/jobs/?sort=interest'

    expect(page).to have_content 'All Jobs Sorted By Interest'
    expect(page).to have_content job.city
    expect(page).to have_content job.title
    expect("#{job.level_of_interest}").to appear_before job.title
  end
end
