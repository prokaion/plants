class OfferRunner

  # shop parameter is optional. if none (nil) is given all shops will be handled.
  def runner(shop_id = nil)

    if( shop_id.nil? )
      Shop.all.each do |shop|
        next if shop.paths.nil?
        
        # get right parser for shop (fetcher) 
        @fetcher = ShopParser::DataFetcher.new(shop.name.downcase)

        get_and_persist_offers(shop.paths)
      end      
    else
      shop = Shop.find(shop_id)
      # get right parser for shop (fetcher) 
      @fetcher = ShopParser::DataFetcher.new(shop.name.downcase)
      get_and_persist_offers(shop.paths)
    end
  end

  # for convenience
  def get_offers_by_path(path)
    array = [path]
    get_and_persist_offers(array)
  end

  private
    def get_and_persist_offers(pathes)

      pathes.each do |path|

        url = create_main_offer_url(path)      

        # gather urls for each offer
        offer_urls = @fetcher.get_offer_urls(path.shop.url, url) 

        offers_we_have = Offer.where(path_id: path.id).select("name").to_a
        puts offers_we_have.first

        builder = OfferBuilder.new
        # fetch offer from each offer_url
        offer_urls.each do |url|
          offer_map = @fetcher.fetch_data( url )
          offer = builder.build(offer_map, path.id)

          offer.save
          # remove the offer from offers_we_have
          offers_we_have.delete_if { |offer_we_have| offer_we_have.name == offer.name }
        end
        # set all offers active = 0 which are still in offers_we_have
        offers_we_have.each do |offer|
          offer = Offer.find_by(offer.name)
          offer.update(active: false)
        end     
      end
    end

    def create_main_offer_url(path)
              # get url from shop
        url = path.shop.url      
        # get all subPathes from path
        sub_paths = SubPath.where("path_id = ?", path.id)

        sub_paths.each do |sub_path|
          url += sub_path.part
        end
        Rails.logger.info url
        return url
    end
end