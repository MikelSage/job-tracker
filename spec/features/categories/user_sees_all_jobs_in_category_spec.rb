require 'rails_helper'

RSpec.feature 'User visits category show page' do
  scenario 'and sees category name and all jobs in that category' do
    category = create(:category, :with_jobs, job_count: 3)
    job1, job2 = category.jobs

    visit category_path(category)
    save_and_open_page
    expect(page).to have_content category.title
    expect(page).to have_content job1.title
    expect(page).to have_content job2.title
  end
end
