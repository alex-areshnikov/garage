class Phone < ApplicationRecord
  has_paper_trail

  COUNTRY_CODE = 'BY'.freeze

  belongs_to :person

  validates :number, phone: true

  delegate :carrier, to: :phone

  def number_international
    phone.international
  end

  def number_national
    phone.national
  end

  def full_number
    "#{number_international} (#{carrier})"
  end

  def number=(value)
    parsed_phone = Phonelib.parse(value, COUNTRY_CODE)
    super(parsed_phone.valid? ? parsed_phone.international(false) : value)
  end

  private

  def phone
    Phonelib.parse(self[:number], COUNTRY_CODE)
  end
end
