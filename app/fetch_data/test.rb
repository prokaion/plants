puts "hello!!!!!!!!!!!!!!!!!!!!!!!!!!"
=begin
begin
  raise "Amount must be more than zero"
rescue => exception
  Rails.logger.info exception
end
=end

fetcher = ShopParser::DataFetcher.new("holländer")

fetcher.fetch_data("http://www.pflanzencenter-berlin.de//zimmerpflanzen/bueropflanzen/areca-palme-1.php")
#fetcher.testParseFileWithRegex("holl1.html")

puts "end!"