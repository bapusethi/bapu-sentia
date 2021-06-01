class Affiliation < ApplicationRecord
  before_validation :capitalize_name

  def self.fetch_by_name(name)
    find_or_create_by(name: normalize(name))
  end

  private

  def capitalize_name
    self.name = Affiliation.normalize(name)
  end
  
  def self.normalize(name)
    name.capitalize
  end
end
