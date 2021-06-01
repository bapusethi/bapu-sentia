require 'rails_helper'

RSpec.describe User, type: :model do
  describe '::add' do
    before {
      described_class.add({ 
        'name' => 'bapu sethi', 'sex' => 'm', 'species' => 'human',
        'location' => 'sydney', 'affiliation' => 'nexl' })
    }

    subject { User.last }

    it {
      expect(subject).to have_attributes({ first_name: 'Bapu', last_name: 'Sethi', gender: 'male', species: 'human' })
    }

    it {
      expect(subject.locations).to be_present
    }

    it {
      expect(subject.affiliations).to be_present
    }
  end
end
