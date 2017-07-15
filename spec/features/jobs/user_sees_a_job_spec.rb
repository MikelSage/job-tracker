require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company, along with comments" do
    company = create(:company, :with_jobs, job_count: 1)
    job = company.jobs.last
    job.comments << create_list(:comment, 3)
    comment = job.comments.last

    visit company_job_path(company, job)

    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.level_of_interest
    expect(page).to have_content comment.content
  end
end
