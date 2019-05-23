class DocumentUploader < ApplicationUploader
  def size_range
    1..50.megabytes
  end
end
