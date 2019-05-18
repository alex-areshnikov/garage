# frozen_string_literal: true

ActiveRecord::Base.transaction do
  # blank site
  Site.create!(name: "001A")

  # built site
  Site.create!(name: "005Д", area: 1500, built: true, basement: true, registered: true, cars_count: 2)

  # built site with electricity
  Site.create!(
    name: "012Г", built: true, basement: true, registered: true, cars_count: 3,
    electricity: true, electricity_counter_name: "СД007",
    electricity_counter_expiration_date: (Date.current + 6.month).beginning_of_month
  )
end
