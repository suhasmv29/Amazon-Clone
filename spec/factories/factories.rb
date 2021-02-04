FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

FactoryBot.define do
  factory :product do
    id {'14'}
    title {'Test product'}
    description {'test description'}
    image_url {'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'}
    price {'10'}
  end
end
FactoryBot.define do
  factory :line_item do
    quantity {1}

  end
end
FactoryBot.define do
  factory :order do
    name {'Test order'}
    address {'Test address for order'}
    pay_type {'Debit card'}
    

  end
end
FactoryBot.define do
  factory :cart do

  end
end
FactoryBot.define do
  factory :category do
    id {1}
    name {'test category'}
    desc {'test desc category'}
  end
end
