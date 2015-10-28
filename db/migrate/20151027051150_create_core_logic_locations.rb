class CreateCoreLogicLocations < ActiveRecord::Migration
  def up
    create_table :core_logic_locations do |t|
      t.date  :date
      t.string :county_name
      t.string :state
      t.string :cbsa_name
      t.string :zip_code
      t.string :tier_name
      t.integer :new_listings_inventory_count, default: 0
      t.float :new_listings_inventory_count_12m_change, default: 0
      t.integer :active_listings_inventory_count, default: 0
      t.float :active_listings_inventory_count_1m_change, default: 0
      t.integer :sold_inventory_count, default: 0
      t.float :sold_inventory_count_12m_change, default: 0
      t.float :sold_inventory_count_1m_change, default: 0
      t.float :sold_listings_dom_mean, default: 0
      t.float :sold_listings_dom_mean_12m_change, default: 0
      t.float :sold_list_price_mean, default: 0
      t.float :sold_list_price_mean_12m_change, default: 0
      t.float :sold_list_price_mean_1m_change, default: 0
      t.float :active_list_price_mean, default: 0
      t.float :active_list_price_median, default: 0
      t.float :active_listings_dom_mean, default: 0
      t.float :cumulative_active_dom_mean, default: 0
      t.timestamps null: false
    end

    add_index :core_logic_locations, [:zip_code, :date], unique: true
  end

  def down
    drop_table :core_logic_locations
  end
end
