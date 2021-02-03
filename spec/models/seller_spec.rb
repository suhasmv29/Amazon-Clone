require 'rails_helper'

RSpec.describe Seller, type: :model do
    context 'validates the presence' do

        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }

      end
end
