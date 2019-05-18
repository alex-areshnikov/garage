# frozen_string_literal: true

ActiveRecord::Base.transaction do
  site = Site.first!

  Person.create!(
    site: site,
    first_name: "Олег",
    last_name: "Смирнов"
  )

  Person.create!(
    site: site,
    first_name: "Иван",
    middle_name: "Иванович",
    last_name: "Морозов",
    birthdate: Date.current - 25.years,
    passport_number: "МХ2993723",
    passport_issued_by: "Фрунценское РУУС, г. Минск",
    passport_issue_date: Date.current - 3.years
  )

  Person.create!(
    site: site,
    first_name: "Зоя",
    middle_name: "Геннадиевна",
    last_name: "Оттопырь",
    person_type: People::Constants::RENTER
  )
end
