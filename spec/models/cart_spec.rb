require 'rails_helper'

RSpec.describe Cart, type: :model do

      # Cart model associations
      it { is_expected.to have_db_column(:user_id)}
      it { should have_many(:line_items).dependent(:destroy) }
      
      # Cart model method
      describe '#add_product' do
            context 'current_item' do

                  it 'Check the add to product model' do
                        cart = create(:cart)
                        category = create(:category)
                        product = create(:product, category_id: category.id)  

                        cart.add_product(product).save!
                        cart.add_product(product).save!
                        binding.pry

                        expect(cart.line_items.size).to eq(1) 
                  end
                  it 'Check the total price function' do
                        cart = create(:cart)
                        category = create(:category)
                        product = create(:product, category_id: category.id) 
                        cart.add_product(product).save!
                        expect(cart.total_price).to eq(product.price)
                  end
            end
      end
end
  
