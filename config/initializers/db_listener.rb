# ActiveRecord::Base.connection_pool.with_connection do |connection|
#   begin
#     connection.execute 'LISTEN invoices_changed'

#     connection.raw_connection.wait_for_notify do |channel, _pid, payload|
#       Rails.logger.info "Received a NOTIFY on channel #{channel}"
#       InvoiceBatchNotifierJob.perform_now(payload)
#     end
#   ensure
#     connection.execute 'UNLISTEN *'
#   end
# end

# def connection
#   ActiveRecord::Base.connection
# end
