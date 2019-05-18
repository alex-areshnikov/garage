class Person < ApplicationRecord
  has_paper_trail

  extend Enumerize

  belongs_to :site
  has_many :phones, dependent: :destroy

  validates_presence_of :first_name, :last_name, :person_type

  enumerize :person_type, in: People::Constants::PERSON_TYPES, default: People::Constants::OWNER

  def name
    "#{first_name} #{last_name}"
  end

  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ')
  end
end
