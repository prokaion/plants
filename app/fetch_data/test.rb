puts "hello!!!!!!!!!!!!!!!!!!!!!!!!!!"
=begin
begin
  raise "Amount must be more than zero"
rescue => exception
  Rails.logger.info exception
end
=end

fetcher = ShopParser::DataFetcher.new("holländer")
puts fetcher

offers_we_have = Offer.where(path_id: 1).select("name")
byebug
puts "offers? " + offers_we_have.first.name
puts "end....."