class Payment < ApplicationRecord
  validates_presence_of :payment_type, :units_paid, :value
end
