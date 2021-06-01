require 'rails_helper'

RSpec.describe Affiliation, type: :model do
  subject { described_class.create(name: 'affliction') }
  
  it('has capitalized names'){
    expect(subject.name).to eq('Affliction')
  }
end
