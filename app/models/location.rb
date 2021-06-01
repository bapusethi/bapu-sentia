class Location < ApplicationRecord
  before_validation :capitalize_address

  def self.fetch_by_address(address)
    find_or_create_by(address: normalize(address))
  end

  private

  def capitalize_address
    self.address = Location.normalize(address)
  end

  def self.normalize(address)
    address.titleize
  end
end
