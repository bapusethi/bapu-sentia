class Import < ApplicationRecord
  has_one_attached :csv_file
  after_create_commit :queue_processing_job

  def process
    CSV.parse(csv_file.open(&:read), headers: true).each { |row|
      attrs = map_row_to_attributes(row)
      User.add(attrs)
    }
  end

  private

  def map_row_to_attributes(row)
    attrs = row.to_h.transform_keys(&:downcase)
    attrs['affiliation'] = attrs.delete('affiliations')
    attrs['sex'] = attrs.delete('gender')
    attrs
  end

  def queue_processing_job
    ProcessCsvFileJob.perform_later(self)
  end
end
