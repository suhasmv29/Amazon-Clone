

FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
      password {"123456"}
      password_confirmation {"123456"}
    end
  end
FactoryBot.define do
    factory :seller do
        sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
        password {"123456"}
        password_confirmation {"123456"}
    end
end

FactoryBot.define do
  factory :category do
     name {"My title"}
      desc {"My title"}
      id {1}
  end
end

FactoryBot.define do
  factory :product do
    sequence(:title) { |y| "JIRA OI-6#{y}" }
     description {"My title"}
     image_url {"https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGF3bnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"}
     price { 250 }
     category {FactoryBot.create(:category)}
  end
end
FactoryBot.define do
  factory :order do
     name {"My title"}
     address {"My title"}
     sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
     pay_type { "Credit card" }
    
    user_id {1}
  end
end
FactoryBot.define do
  factory :cart do
    user_id {1}
  end
end
FactoryBot.define do
  factory :line_item do
    product {FactoryBot.create(:product)}
    cart {FactoryBot.create(:cart)}
    order {FactoryBot.create(:order)}
   
    quantity {1}
  end
end


