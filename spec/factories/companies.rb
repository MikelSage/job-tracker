FactoryGirl.define do
  factory :company do
    sequence :name do |n|
    "Company #{n}"
    end

    trait :with_jobs do
      transient do
        job_count 3
      end

      after(:create) do |company, evaluator|
        company.jobs << create_list(:job, evaluator.job_count)
      end
    end
  end
end
