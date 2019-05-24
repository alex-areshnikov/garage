# frozen_string_literal: true

ActiveRecord::Base.transaction do
  default_base_rate = 25

  BaseRate.create!(year: 2015, rate: default_base_rate)
  BaseRate.create!(year: 2016, rate: default_base_rate)
  BaseRate.create!(year: 2017, rate: default_base_rate)
  BaseRate.create!(year: 2018, rate: default_base_rate)
  BaseRate.create!(year: 2019, rate: default_base_rate)
end
