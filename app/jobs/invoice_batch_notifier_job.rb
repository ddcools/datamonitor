class InvoiceBatchNotifierJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Code specifics related to updating invoice batch goes here
    Rails.logger.info 'Performing Invoice batch processing'
  end
end
