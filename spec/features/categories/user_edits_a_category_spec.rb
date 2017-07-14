require 'rails_helper'

RSpec.feature 'User edits a category' do
  scenario 'and sees the new information' do
    category = create(:category, :with_jobs)
    old_title = category.title

    visit category_path(category)
    
    expect(page).to have_content old_title

    visit edit_category_path(category)

    fill_in 'category_title', with: 'New Title'
    click_on 'Update Category'

    expect(page).to have_content 'New Title'
    expect(page).to_not have_content old_title
  end
end
