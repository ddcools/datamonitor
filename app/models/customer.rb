# frozen_string_literal: true

# Customer
class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy

  validates :first_name, :last_name, presence: true
end
