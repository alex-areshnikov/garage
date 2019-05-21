class PeopleSite < ApplicationRecord
  extend Enumerize

  has_paper_trail

  belongs_to :site
  belongs_to :person

  validates_presence_of :site, :person, :relationship
  validates_uniqueness_of :relationship, scope: %i[site person]

  enumerize :relationship, in: People::Constants::TYPES, default: People::Constants::OWNER
end
