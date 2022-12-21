class InvoiceBatchNotifierJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Code specifics related to updating invoice batch goes here
    p '*' * 100
    p 'TEST JOb'
    p '*' * 100
  end
end
