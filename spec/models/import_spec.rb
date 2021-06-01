require 'rails_helper'

RSpec.describe Import, type: :model do
  describe 'process' do
    let(:import) { described_class.create }
    
    before{
      allow(User).to receive(:add)
      import.csv_file.attach(
        io: File.open(file_fixture('sentia.csv'), 'rb'),
        filename: 'sentia.csv'
      )
      import.process
    }

    it{
      expect(User).to have_received(:add).with(
        { "affiliation"=>"Sith", "location"=>"Death Star, Tatooine", 
          "name"=>"Darth Vadar", "sex"=>"Male", "species"=>"Human", 
          "vehicle"=>"Tiefighter", "weapon"=>"Lightsaber"
        }
      )

      expect(User).to have_received(:add).with(
        {
         "affiliation"=>"Rebel Alliance", "location"=>"kashyyk", "name"=>"Chewbacca",
         "sex"=>"m", "species"=>"Wookie", "vehicle"=>"Millennium Falcon",
         "weapon"=>"Bowcaster"
        }
      )
    }
  end
end
