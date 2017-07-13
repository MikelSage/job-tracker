require 'rails_helper'

RSpec.feature 'User visits categories index' do
  scenario 'and sees a list of the categories with delete and edit links' do
    category1, category2 = create_list(:category, 3)

    visit categories_path

    expect(page).to have_link(category1.title, href: category_path(category1))
    expect(page).to have_link(category2.title, href: category_path(category2))
    expect(page).to have_link('Edit', href: edit_category_path(category1))
    expect(page).to have_link('Delete', href: category_path(category1))
  end
end
