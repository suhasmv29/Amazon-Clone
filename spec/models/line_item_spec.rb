require 'rails_helper'

RSpec.describe LineItem, type: :model do
  context 'columns' do
    it { is_expected.to have_db_column(:product_id)}
  end
  
end
