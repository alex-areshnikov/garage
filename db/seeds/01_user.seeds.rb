ActiveRecord::Base.transaction do
  admin = User.new(email: "admin@garage.com")
  admin.password = "12341234Aa"
  admin.save!
end
