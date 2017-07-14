FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "Category #{n}"
    end

    trait :with_jobs do
      transient do
        job_count 3
      end

      after(:create) do |category, evaluator|
        category.jobs << create_list(:job, evaluator.job_count)
      end
    end
  end
end
