require 'rails_helper'

RSpec.feature 'User creates a new category' do
  scenario 'add sees their brand new category' do
    visit new_category_path

    fill_in 'category_title', with: 'Quality Assurance'

    click_button 'Create Category'

    expect(page).to have_content 'Quality Assurance'
  end
end
