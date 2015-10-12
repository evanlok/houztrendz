require 'typhoeus/adapters/faraday'

Faraday.default_adapter = :typhoeus
Faraday.default_connection = Faraday::Connection.new do |f|
  f.adapter :typhoeus
end
