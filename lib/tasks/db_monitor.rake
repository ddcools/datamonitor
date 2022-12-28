namespace :db_monitor do
  desc 'This is monitoring the Invoice table and Update the invoice batch accordingly'
  task invoice_data_monitor: :environment do
    unless Rails.env.test?

      ActiveRecord::PostgresPubSub::Listener.listen('invoices_changed') do |listener|
        listener.on_start do
          puts 'Listening for the DB notifications...'
        end

        listener.on_notify do
          puts 'Received notification on the invoices_changed channel!'
          Invoice.update_batch_invoice
        end
      end
    end
  end
end
