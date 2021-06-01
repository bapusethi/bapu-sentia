require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    before do
      10.times { |i| User.create(first_name: "first_name_#{i}", species: %w(Human Wookie).sample, gender: %w(male female other).sample ) }
    end

    it 'suppots all params' do
      get :index, params: { page: '1', per: '5', term: 'first_name' }
      expect(assigns(:users).count).to eq(5)
    end

    it 'suppots searching terms' do
      get :index, params: { page: '1', per: '10', term: 'Human' }
      expect(assigns(:users).count).to eq(User.where(species: 'Human').count)
    end
  end
end
