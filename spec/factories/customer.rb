# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { 'John' }
    last_name { 'S' }
    city { 'Bangalore' }
    pincode { 560_076 }
  end
end
