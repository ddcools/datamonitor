# frozen_string_literal: true

# CreateNotifyOnInvoicesInsertTrigger
class CreateNotifyOnInvoicesInsertTrigger < ActiveRecord::Migration[5.1]
  TABLE_NAME = 'invoices'
  NOTIFICATION_NAME = 'invoice'
  TABLE_MODULE = ''

  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION notify_#{TABLE_MODULE}_listeners() RETURNS TRIGGER AS $$
      DECLARE
      BEGIN
        PERFORM pg_notify('#{NOTIFICATION_NAME}', null);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql
    SQL

    execute <<-SQL
      CREATE TRIGGER #{TABLE_MODULE}_trigger
      AFTER INSERT
      ON #{TABLE_NAME}
      FOR EACH STATEMENT
      EXECUTE PROCEDURE notify_#{TABLE_MODULE}_listeners()
    SQL
  end

  def down
    execute <<-SQL
      DROP FUNCTION notify_#{TABLE_MODULE}_listeners() CASCADE
    SQL
  end
end
