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

  describe 'class methods' do
    describe '.sort_by' do
      it "returns jobs sorted by location" do
        company = create(:company, :with_jobs)
        job = company.jobs.first
        create_list(:job, 2, city: job.city)

        result = Job.sort_by_location

        expect(result[job.city].count).to eq (3)
        expect(result[job.city].first).to be_an_instance_of(Job)
      end
    end
  end
end
