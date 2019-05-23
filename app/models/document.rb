class Document < ApplicationRecord
  extend Enumerize

  has_paper_trail
  mount_uploader :file, DocumentUploader

  enumerize :document_type, in: Documents::Constants::TYPES, default: Documents::Constants::GENERIC

  belongs_to :owner, polymorphic: true

  validates_presence_of :file

  def name
    return super if file.blank?

    attribute(:name).blank? ? filename : super
  end

  def filename
    File.basename(file.path)
  end
end
