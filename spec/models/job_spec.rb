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
    describe '.sort_by_location' do
      it "returns jobs sorted by location" do
        company = create(:company, :with_jobs)
        job = company.jobs.first
        create_list(:job, 2, city: job.city)

        result = Job.sort_by_location

        expect(result[job.city].count).to eq (3)
        expect(result[job.city].first).to be_an_instance_of(Job)
      end
    end

    describe '.count_by_interest' do
      it "returns the count by level_of_interest" do
        create(:job, level_of_interest: 20)
        create(:job, level_of_interest: 20)
        create(:job, level_of_interest: 20)
        create(:job, level_of_interest: 10)
        create(:job, level_of_interest: 40)
        create(:job, level_of_interest: 40)

        result = Job.count_by_interest

        expect(result[20]).to eq 3
        expect(result[40]).to eq 2
        expect(result[10]).to eq 1
      end
    end

    describe '.top_companies' do
      it "returns the top 3 companies by average level of interest" do
        companies = create_list(:company, 4, :with_jobs)

        total_interest = companies.last.jobs.reduce(0) do |num, job|
          num += job.level_of_interest
        end

        average = total_interest/companies.last.jobs.count

        result = Job.top_companies

        expect(result[0][0]).to eq(companies.last.name)
        expect(result[0][1]).to eq(average)
      end
    end
  end
end
