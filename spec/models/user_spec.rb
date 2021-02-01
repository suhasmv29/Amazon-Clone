require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { is_expected.to have_one(:cart) }

 
end
