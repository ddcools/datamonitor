# frozen_string_literal: true

require 'async'

unless Rails.env.test?
  Async do
    ActiveRecord::PostgresPubSub::Listener.listen('invoices_changed') do |listener|
      listener.on_start do
        Rails.logger.info 'Started Listening to the notifications'
      end

      listener.on_notify do
        Rails.logger.info 'Received notifications'
        Invoice.update_batch_invoice
      end
    end
  end
end
