class BaseRate < ApplicationRecord
  has_paper_trail

  validates_presence_of :year, :rate
  validates_uniqueness_of :year
end
