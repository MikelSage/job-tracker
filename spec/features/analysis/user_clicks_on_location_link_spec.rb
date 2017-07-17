require 'rails_helper'

RSpec.feature 'User clicks on a location link' do
  scenario 'and is taken to a page with all jobs at that location' do
    create(:job, city: 'Denver', title: 'Poop Scoop')
    create(:job, city: 'Denver', title: 'Junior Dev')
    create(:job, city: 'New York', title: 'Pediatrician')
    create(:job, city: 'New York', title: 'Neurologist')
    create(:job, city: 'Denver', title: 'Senior Poop Scoop')
    create(:job, city: 'Seattle', title: 'Weed Shop Clerk')

    visit '/dashboard'

    click_on 'Denver'

    expect(page).to have_content 'Poop Scoop'
    expect(page).to have_content 'Senior Poop Scoop'
    expect(page).to have_content 'Junior Dev'
  end
end
