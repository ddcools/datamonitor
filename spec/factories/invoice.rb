# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    is_paid { true }
    total { 100 }
  end
end
