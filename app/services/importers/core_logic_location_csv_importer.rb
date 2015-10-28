require 'csv'

module Importers
  class CoreLogicLocationCSVImporter
    DEFINITION_NAME = 'CoreLogic'.freeze
    # =======================================================================
    # Attribute order matters. Check the CSV format before changing anything.
    # =======================================================================
    ATTRIBUTES = %w(
      county_name
      state
      cbsa_name
      zip_code
      tier_name
      new_listings_inventory_count
      new_listings_inventory_count_12m_change
      active_listings_inventory_count
      active_listings_inventory_count_1m_change
      sold_inventory_count
      sold_inventory_count_12m_change
      sold_inventory_count_1m_change
      sold_listings_dom_mean
      sold_listings_dom_mean_12m_change
      sold_list_price_mean
      sold_list_price_mean_12m_change
      sold_list_price_mean_1m_change
      active_list_price_mean
      active_list_price_median
      active_listings_dom_mean
      cumulative_active_dom_mean
    ).freeze

    SHARED_ATTRIBUTES = ATTRIBUTES.first(5).freeze

    def initialize(file_path)
      @file_path = file_path
    end

    def import
      current_date = nil

      CSV.foreach(@file_path, converters: :numeric) do |row|
        # Date row
        if row[0] =~ /Period Date:/
          month, day, year = row[0].split(':').last.strip.split('/').map(&:to_i)
          current_date = Date.new(year, month, day)

          # Data row
        elsif row[3].to_s =~ /\A\d+\z/ && current_date
          zip_code = row[3]
          parsed_row = row.map { |val| parse_value(val) }
          core_logic_location = CoreLogicLocation.where(zip_code: zip_code, date: current_date).first_or_initialize

          ATTRIBUTES.each_with_index do |attr, i|
            core_logic_location[attr] = parsed_row[i]
          end

          begin
            core_logic_location.save!
          rescue ActiveRecord::RecordInvalid => e
            raise e
            Honeybadger.notify(e, context: { zip_code: zip_code, date: current_date })
          end
        end
      end
    end

    private

    def parse_value(input)
      return input unless input.is_a?(String)

      case input
      when /\A-?[\d\.,]+[^%]\z/
        input.gsub(',', '').to_f
      when /\A.+%\z/
        input.gsub(/,%/, '').to_f
      else
        input
      end
    end
  end
end
