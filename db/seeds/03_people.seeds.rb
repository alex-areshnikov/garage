# frozen_string_literal: true

ActiveRecord::Base.transaction do
  site = Site.first!

  person_oleg = Person.create!(
    first_name: "Олег",
    last_name: "Смирнов"
  )

  person_ivan = Person.create!(
    first_name: "Иван",
    middle_name: "Иванович",
    last_name: "Морозов",
    address: "ул. Космонавтов 10-122, г. Минск",
    birthdate: Date.current - 25.years,
    passport_number: "МХ2993723",
    passport_issued_by: "Фрунценское РУУС, г. Минск",
    passport_issue_date: Date.current - 3.years
  )

  person_zoya = Person.create!(
    first_name: "Зоя",
    middle_name: "Геннадиевна",
    last_name: "Оттопырь"
  )

  PeopleSite.create!(person: person_oleg, site: site, relationship: People::Constants::OWNER)
  PeopleSite.create!(person: person_ivan, site: site, relationship: People::Constants::OWNER)
  PeopleSite.create!(person: person_zoya, site: site, relationship: People::Constants::RENTER)
end
