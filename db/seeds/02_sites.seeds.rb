# frozen_string_literal: true

lorem_ipsum = "Задача организации, в особенности же новая модель организационной деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности влечет за собой процесс внедрения и модернизации форм развития. Товарищи! новая модель организационной деятельности способствует подготовки и реализации дальнейших направлений развития. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия."

ActiveRecord::Base.transaction do
  # blank site
  Site.create!(name: "001A", area: 335)

  # built site
  Site.create!(name: "005Д", notes: lorem_ipsum, area: 175.2, built: true, basement: true, registered: true, cars_count: 2)

  # built site with electricity
  Site.create!(
    name: "012Г", built: true, basement: true, registered: true, cars_count: 3,
    electricity: true, electricity_counter_name: "СД007",
    electricity_counter_expiration_date: (Date.current + 6.month).beginning_of_month
  )
end
