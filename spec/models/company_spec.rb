require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name)}
    it {is_expected.to have_many(:jobs)}
    it {is_expected.to have_many(:contacts)}
  end
end
