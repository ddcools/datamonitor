require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :customer_id }
    it { is_expected.to validate_presence_of :total }
  end
end
