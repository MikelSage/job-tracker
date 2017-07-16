FactoryGirl.define do
  factory :job do
    sequence :title do |n|
      "Job #{n}"
    end

    description "The best job ever"

    sequence :level_of_interest do |n|
      n * 5
    end

    sequence :city do |n|
      "City #{n}"
    end

    company
    category
  end
end
