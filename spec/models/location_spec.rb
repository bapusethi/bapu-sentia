require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { described_class.create(address: 'sydney australia') }
  
  it('has titleize address'){
    expect(subject.address).to eq('Sydney Australia')
  }
end
