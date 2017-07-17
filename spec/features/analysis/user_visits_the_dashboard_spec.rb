require 'rails_helper'

RSpec.feature "User visits the dashboard" do
  scenario 'and they see a count of jobs by level of interest' do
    create(:job, level_of_interest: 20)
    create(:job, level_of_interest: 20)
    create(:job, level_of_interest: 20)
    create(:job, level_of_interest: 10)
    create(:job, level_of_interest: 40)
    create(:job, level_of_interest: 40)

    visit '/dashboard'

    expect(page).to have_css('.level_of_interest_40', text: '2')
    expect(page).to have_css('.level_of_interest_20', text: '3')
    expect(page).to have_css('.level_of_interest_10', text: '1')
  end

  scenario 'and they see top three companies by average interest' do
    companies = create_list(:company, 4, :with_jobs)

    total_interest = companies.last.jobs.reduce(0) do |num, job|
      num += job.level_of_interest
    end

    average = total_interest/companies.last.jobs.count

    visit '/dashboard'

    expect(page).to have_content companies.last.name
    expect(page).to have_content average
    expect(page).to_not have_content "#{companies.first.name}: "
    expect(companies.last.name).to appear_before(companies[1].name)
  end

  scenario 'and they see a count of jobs by location' do
    create(:job, city: 'Denver')
    create(:job, city: 'Denver')
    create(:job, city: 'New York')
    create(:job, city: 'New York')
    create(:job, city: 'Denver')
    create(:job, city: 'Seattle')

    visit '/dashboard'

    expect(page).to have_link('Denver', href: '/jobs/?location=Denver')
    expect(page).to have_content(3)
  end
end
