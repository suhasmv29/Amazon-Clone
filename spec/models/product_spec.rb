require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'columns' do
    it { is_expected.to have_db_column(:title)}
    it { is_expected.to have_db_column(:description)}
    it { is_expected.to have_db_column(:image_url)}
    it { is_expected.to have_db_column(:price)}
  end
  # Testing the validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:image_url)}



  # it { should belong_to(:user).without_validating_presence }


  # Checking the associations
  it { should have_many(:line_items)}
  it { should have_many(:orders).through(:line_items)}

end
