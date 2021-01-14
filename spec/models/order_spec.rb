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

  # it { should belong_to(:user).without_validating_presence }
  it { should have_many(:line_items).dependent(:destroy) }
  
end
