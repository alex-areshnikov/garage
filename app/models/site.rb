class Site < ApplicationRecord
  has_paper_trail

  has_many :people_sites, dependent: :destroy
  has_many :people, through: :people_sites

  has_many :owners,
           -> { where(people_sites: { relationship: People::Constants::OWNER }) },
           source: :person, through: :people_sites

  has_many :renters,
           -> { where(people_sites: { relationship: People::Constants::RENTER }) },
           source: :person, through: :people_sites

  validates_presence_of :name

  accepts_nested_attributes_for :people_sites, allow_destroy: true
end
