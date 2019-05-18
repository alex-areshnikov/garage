class Phone < ApplicationRecord
  has_paper_trail

  COUNTRY_CODE = 'BY'.freeze

  validates_presence_of :number

  delegate :carrier, to: :phone

  def number
    phone.international
  end

  def number=(value)
    parsed_phone = Phonelib.parse(value, COUNTRY_CODE)
    super(parsed_phone.international) if parsed_phone.valid?
  end

  private

  def phone
    Phonelib.parse(self[:number], COUNTRY_CODE)
  end
end
