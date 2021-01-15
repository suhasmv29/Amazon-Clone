require 'rails_helper'

RSpec.describe Cart, type: :model do

      # Testing columns exits
      it { is_expected.to have_db_column(:user_id)}
      it { should have_many(:line_items).dependent(:destroy) }
  
end
