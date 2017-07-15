FactoryGirl.define do
  factory :comment do
    sequence :content do |n|
      "Comment #{n}"
    end

    job
  end
end
