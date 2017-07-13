require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company, company2 = create_list(:company, 2)

    visit companies_path

    expect(page).to have_content(company.name)
    expect(page).to have_content(company2.name)
  end
end
