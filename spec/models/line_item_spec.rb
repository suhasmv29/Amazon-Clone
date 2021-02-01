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
  # it { should belong_to(:order).optional } 

end
