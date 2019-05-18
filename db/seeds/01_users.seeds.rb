# frozen_string_literal: true

ActiveRecord::Base.transaction do
  admin = User.new(email: "admin@garage.com")
  admin.password = "12341234"
  admin.save!
end
