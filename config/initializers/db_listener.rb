ActiveRecord::PostgresPubSub::Listener.listen('invoices_changed') do |listener|
  listener.on_start do
    Rails.logger.info 'Started Listening to the notifications'
  end

  listener.on_notify do
    Rails.logger.info 'Received notifications'
    InvoiceBatchNotifierJob.perform_now(payload)
  end
end
