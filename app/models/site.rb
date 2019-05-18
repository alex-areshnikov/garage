class Site < ApplicationRecord
  has_paper_trail

  has_many :people, dependent: :destroy

  validates_presence_of :name
end
