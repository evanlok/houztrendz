require 'rails_helper'

RSpec.describe Admin::CoreLogicLocationsController do
  login_admin
  let(:core_logic_location) { create(:core_logic_location) }

  describe 'GET index' do
    it 'renders page' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET new' do
    it 'renders page' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'creates new record' do
      post :create, core_logic_location: { date: Date.today, county_name: 'Alameda', state: 'CA', zip_code: '94102' }
      expect(response).to redirect_to(admin_core_logic_locations_url)
    end

    context 'with invalid params' do
      it 'renders new' do
        post :create, core_logic_location: { date: Date.today }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET edit' do
    it 'renders page' do
      get :edit, id: core_logic_location
      expect(response).to be_success
    end
  end

  describe 'PATCH update' do
    it 'updates record' do
      patch :update, id: core_logic_location, core_logic_location: { zip_code: '12345' }
      expect(core_logic_location.reload.zip_code).to eq('12345')
      expect(response).to redirect_to(admin_core_logic_locations_url)
    end

    context 'with invalid params' do
      it 'renders edit' do
        patch :update, id: core_logic_location, core_logic_location: { date: '' }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'delete record' do
      delete :destroy, id: core_logic_location
      expect(response).to redirect_to(admin_core_logic_locations_url)
      expect(CoreLogicLocation.where(id: core_logic_location).exists?).to be false
    end
  end

  describe 'POST import' do
    it 'runs csv importer' do
      expect_any_instance_of(Importers::CoreLogicLocationCSVImporter).to receive(:import)
      post :import, csv: { file: fixture_file_upload('files/core_logic_locations.csv', 'text/csv') }
      expect(response).to redirect_to(admin_core_logic_locations_url)
    end
  end
end
