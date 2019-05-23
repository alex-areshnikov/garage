# frozen_string_literal: true

short_description = "Короткое описание."
shorter_description = "Более длинное описание. На пару слов большее, чем короткое описание."


ActiveRecord::Base.transaction do
  people = Person.first(3)

  Phone.create!(number: '297334455', description: short_description, person: people.first)
  Phone.create!(number: '296334455', description: shorter_description, person: people.first)
  Phone.create!(number: '294334455', person: people.first)
  Phone.create!(number: '444334455', person: people.last)

  Phone.create!(number: '297771267', description: short_description, person: people[1])
  Phone.create!(number: '297639021', person: people[1])
end
