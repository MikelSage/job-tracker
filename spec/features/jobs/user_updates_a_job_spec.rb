require 'rails_helper'

RSpec.feature 'User edits a job' do
  scenario 'and they see the updated information' do
    company = create(:company, :with_jobs, job_count: 2)
    job = company.jobs.last
    old_title, old_descipt = job.title, job.description

    visit company_job_path(company, job)
    
    expect(page).to have_content old_title
    expect(page).to have_content old_descipt

    click_on 'Edit Job'
    fill_in 'job_title', with: 'New Title'
    fill_in 'job_description', with: 'Not too bad working here.'
    fill_in 'job_level_of_interest', with: '10'
    fill_in 'job_city', with: 'Denver'
    click_on 'Update Job'

    expect(page).to have_content 'New Title'
    expect(page).to have_content 'Not too bad working here.'
    expect(page).to_not have_content old_title
    expect(page).to_not have_content old_descipt
  end
end
