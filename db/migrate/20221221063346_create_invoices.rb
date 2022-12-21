# frozen_string_literal: true

# CreateInvoices
class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.boolean 'is_paid', default: false
      t.references :customer, foreign_key: true
      t.integer :total, null: false

      t.timestamps
    end
  end
end
