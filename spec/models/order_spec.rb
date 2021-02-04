require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'columns' do

    # Testing columns exits
    it { is_expected.to have_db_column(:name)}
    it { is_expected.to have_db_column(:address)}
    it { is_expected.to have_db_column(:email)}
  end

  # Testing the validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:email) }

  it { should have_many(:line_items).dependent(:destroy) }

  describe "#add_line_items_from_cart" do
    context 'adding line items to cart' do
      let(:user) {create(:user)} 

      it 'line items getting created' do
        cart = create(:cart,user_id: user.id)
        order = create(:order,email:user.email, user_id:user.id)
        expect(order.add_line_items_from_cart(cart)).to eq([])
      end
      it 'orders taking like items' do
        order = create(:order,email:user.email, user_id:user.id)
        cart = create(:cart,user_id: user.id)
        line_item = create(:line_item)
        cart.line_items << line_item
        order.add_line_items_from_cart(cart)
        expect(cart.line_items.size).to eq(1)
      end

    end 


  end
  
end
