class User < ApplicationRecord
  has_many :user_locations, dependent: :destroy
  has_many :locations, through: :user_locations
  has_many :user_affiliations, dependent: :destroy
  has_many :affiliations, through: :user_affiliations

  validates :first_name, :species, :gender, presence: true
  validates :first_name, uniqueness: { scope: [:last_name] }
  
  before_validation :assign_gender
  before_save :cache_search_text
  after_save :assign_afflictions, :assign_locations

  attr_accessor :sex, :location, :affiliation

  enum gender: { male: 'male', female: 'female', other: 'other' }, _default: 'other'

  scope :search, -> (term) {
    where("search_text like ?", "%#{term.downcase}%") if term.present?
  }

  def self.add(attrs)
    first_name, last_name = break_down_name(attrs.delete('name'))
    user = find_or_initialize_by(first_name: first_name.titleize,
                                 last_name: last_name.titleize)
    user.assign_attributes(attrs)
    user.save
  end
  
  private

  def assign_afflictions
    return if affiliation.blank?

    user_affiliations.find_or_create_by(affiliation: Affiliation.fetch_by_name(affiliation))
  end

  def assign_locations
    return if location.blank?

    user_locations.find_or_create_by(location: Location.fetch_by_address(location))
  end

  def assign_gender
    self.gender = gender_value_mapping(sex)
  end

  def gender_value_mapping(value)
    return :male if ['male', 'm'].find { |sex| sex.casecmp?(value) }
    return :female if ['female', 'f'].find { |sex| sex.casecmp?(value) }
    :other
  end

  def cache_search_text
    self.search_text = "#{first_name} #{last_name} #{gender} #{vehicle} #{species} #{weapon}".downcase
  end

  def self.break_down_name(full_name)
    names = full_name.to_s.split(' ')
    first_name = names.length <= 1 ? names.first.to_s : names[0..-2].join(' ')
    last_name = names.length <= 1 ? '' : names.last

    [first_name, last_name]
  end
end
