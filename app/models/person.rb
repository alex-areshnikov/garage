class Person < ApplicationRecord
  has_paper_trail

  mount_uploader :avatar, AvatarUploader

  has_many :phones, dependent: :destroy

  has_many :people_sites, dependent: :destroy
  has_many :sites, through: :people_sites

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :last_name, scope: :first_name

  accepts_nested_attributes_for :phones, allow_destroy: true

  def name
    "#{first_name} #{last_name}"
  end

  def relationship(site)
    people_sites.find_by(site: site)&.relationship
  end

  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ')
  end
end
