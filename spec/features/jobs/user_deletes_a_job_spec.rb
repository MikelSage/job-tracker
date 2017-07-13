require 'rails_helper'

RSpec.feature 'User deletes a Job' do
  scenario 'and they no longer see that job' do
    company = create(:company, :with_jobs, job_count: 3)
    job_to_delete = company.jobs.first
    job_to_check = company.jobs.last

    visit company_path(company)
    expect(page).to have_content job_to_delete.title
    visit company_job_path(company, job_to_delete)

    click_on 'Delete'
    
    expect(page).to have_content job_to_check.title
    expect(page).to_not have_content job_to_delete.title
  end
end
