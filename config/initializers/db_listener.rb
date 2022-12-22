ActiveRecord::Base.connection_pool.with_connection do |connection|
  conn = connection.instance_variable_get(:@connection)

  begin
    conn.async_exec 'LISTEN invoices_changed'

    conn.wait_for_notify do |channel, _pid, payload|
      Rails.logger.info "Received a NOTIFY on channel #{channel}"
      InvoiceBatchNotifierJob.perform_now(payload)
    end
  ensure
    conn.async_exec 'UNLISTEN *'
  end
end
