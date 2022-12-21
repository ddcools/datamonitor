# frozen_string_literal: true

# CreateCustomers
class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string 'first_name'
      t.string 'last_name'
      t.string 'city'
      t.integer 'pincode'

      t.timestamps
    end
  end
end
