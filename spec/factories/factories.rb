
FactoryBot.define do
    factory :lineitem do

    end
end
FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
      password {"123456"}
    end
  end
FactoryBot.define do
    factory :seller do
        sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
        password {"123456"}
    end
end


