require 'rails_helper'

RSpec.feature 'User comments on a job' do
  scenario 'and they see their new comment' do
    company = create(:company, :with_jobs, job_count: 1)
    job = company.jobs.last
    body = 'Talked to John, totally gonna get this job.'
    body2 = 'Never mind, he hates my face now.'

    visit company_job_path(company, job)

    fill_in "comment[content]", with: body
    click_on 'Submit'

    fill_in "comment[content]", with: body2
    click_on 'Submit'

    expect(page).to have_content body
    expect(page).to have_content body2

    expect(body2).to appear_before(body)
  end
end
