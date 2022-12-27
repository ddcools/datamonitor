# frozen_string_literal: true

# Invoice
class Invoice < ApplicationRecord
  belongs_to :customer

  validates :is_paid, :customer_id, :total, presence: true

  after_update :update_invoice_batch, if: -> { saved_change_to_total? }

  def self.update_batch_invoice
    InvoiceBatchNotifierJob.perform_now
  end

  private

  def update_invoice_batch
    InvoiceBatchNotifierJob.perform_now(self)
  end
end
