require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'POST #create' do
    context 'with invalid params' do
      it "renders the 'new' template" do
        post :create, params: {category: attributes_for(:category, title: nil)}
        expect(response).to render_template('new')
      end
    end
  end
end
