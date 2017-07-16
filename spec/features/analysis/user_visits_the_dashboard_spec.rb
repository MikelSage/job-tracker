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
end
