class ProcessCsvFileJob < ApplicationJob
  include ActionView::Helpers::DateHelper

  def perform(csv_import)
    csv_import.process
  end
end
