# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :is_paid }
    it { is_expected.to validate_presence_of :customer_id }
    it { is_expected.to validate_presence_of :total }
  end

  context 'when testing callback methods' do
    before do
      @customer = FactoryBot.create :customer
      @invoice = FactoryBot.create :invoice, { customer_id: @customer.id }
    end

    describe '#on_update' do
      it 'calls the invoice batch update job' do
        allow(InvoiceBatchNotifierJob).to receive(:perform_now).and_call_original
        expect(InvoiceBatchNotifierJob).to receive(:perform_now)
        @invoice.update(total: 101)
      end
    end
  end
end
