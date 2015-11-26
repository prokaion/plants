require 'offer_runner.rb'

offer_runner = OfferRunner.new

shop_id = ARGV.first

offer_runner.runner(shop_id)
