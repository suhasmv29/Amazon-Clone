require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'columns' do
    it { is_expected.to have_db_column(:title)}
    it { is_expected.to have_db_column(:description)}
    it { is_expected.to have_db_column(:image_url)}
    it { is_expected.to have_db_column(:price)}
  end

  subject {described_class.new}
  # Testing the validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:image_url)}
  
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.1) }


  # Checking the associations
  it { should have_many(:line_items)}
  it { should have_many(:orders).through(:line_items)}

  it { should belong_to(:category) }
  
  describe "#ensure_not_referenced_by_any_line_item" do
    let(:line_items) {create(:line_item)} 
    
    it 'Should throw some error' do
      expect(line_items).to_not be_nil
    end
  end
  
end
