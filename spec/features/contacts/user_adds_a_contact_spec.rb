require 'rails_helper'

RSpec.feature 'User adds a contact to a company' do
  scenario 'add sees the new contact on the page' do
    company = create(:company, name: 'Cartoon Network')
    name = 'Aku'
    position = 'Shapeshifting Master of Darkness'
    email = 'extra_thicc_3011@akumail.com'

    visit company_path(company)
    fill_in 'contact[full_name]', with: name
    fill_in 'contact[position]', with: position
    fill_in 'contact[email]', with: email

    expect(page).to have_content name
    expect(page).to have_content position
    expect(page).to have_content email
  end
end
