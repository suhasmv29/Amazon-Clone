require 'rails_helper'

RSpec.describe LineItem, type: :model do

  context 'columns' do
    it { is_expected.to have_db_column(:product_id)}
    it { is_expected.to have_db_column(:quantity)}
    it { is_expected.to have_db_column(:cart_id)}
    it { is_expected.to have_db_column(:order_id)}
  end
  it { should belong_to(:cart) }
  it { should belong_to(:product).optional }
  it { should belong_to(:order).optional }

  describe '#total_price' do
    let!(:user) { create(:user) }
      it 'this is for the total_price method' do 
        category = create(:category)
        product = create(:product, category_id: category.id)
        order = create(:order, user_id: user.id, email: user.email)
        cart = create(:cart)
        line_item = create(:line_item,order_id: order.id,product_id: product.id,cart_id: cart.id)
        expect(line_item.total_price).to eq(10)
      end
  end
  
end
