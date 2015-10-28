require 'rails_helper'

RSpec.describe Importers::CoreLogicLocationCSVImporter do
  let(:importer) { described_class.new(Rails.root.join('spec', 'fixtures', 'files', 'core_logic_locations.csv')) }

  describe '#import' do
    it 'imports records' do
      importer.import
      expect(CoreLogicLocation.count).to eq(2)
      record = CoreLogicLocation.find_by!(zip_code: '10453')
      expect(record).to have_attributes(
                          county_name: 'Bronx',
                          state: 'New York',
                          cbsa_name: 'New York-Jersey City-White Plains NY-NJ Metropolitan Division',
                          zip_code: '10453',
                          tier_name: 'Single Family Combined',
                          new_listings_inventory_count: 3,
                          new_listings_inventory_count_12m_change: 3.2,
                          active_listings_inventory_count: 14,
                          active_listings_inventory_count_1m_change: -6.67,
                          sold_inventory_count: 1,
                          sold_inventory_count_12m_change: 2.4,
                          sold_inventory_count_1m_change: 2.3,
                          sold_listings_dom_mean: 8,
                          sold_listings_dom_mean_12m_change: 4.2,
                          sold_list_price_mean: 350000,
                          sold_list_price_mean_12m_change: 5.2,
                          sold_list_price_mean_1m_change: 3.4,
                          active_list_price_mean: 365830.0,
                          active_list_price_median: 347143.0,
                          active_listings_dom_mean: 133.0,
                          cumulative_active_dom_mean: 156.0
                        )
    end
  end
end
