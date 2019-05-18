class Site < ApplicationRecord
  has_many :people

  validates_presence_of :name
end
