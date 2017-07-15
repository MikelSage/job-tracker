require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:level_of_interest)}
    it {is_expected.to validate_presence_of(:city)}
    it {is_expected.to belong_to(:company)}
    it {is_expected.to belong_to(:category)}
    it {is_expected.to have_many(:comments)}
  end
end
