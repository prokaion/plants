class ShopParser::DataFetcherDehner < ShopParser::DataFetcher

  def get_offer_urls(domain, url)
    urls = []

    begin
      doc = Nokogiri::HTML(open(url))

      pagination = doc.xpath('//ul[@class="pagination"]').first

      next_link = pagination.search('//a[@class="next"]').first

      doc.xpath('//div[@class="tsr-product cc"]').each do |div_offer| 
        urls.push(domain + div_offer.search('a').first['href'])
      end
      
      # create link for next page
      if (next_link.nil? == false)
        url = domain + next_link['href']        
      end

    end until next_link.nil?

    return urls
  end

  def fetch_data(url)
    offer_map = super(url)

    doc = Nokogiri::HTML(open(url))

    offer_map[:offer_name] = doc.xpath('//li[@class="last"]').text
    description =  doc.xpath('//div[@class="txt clearfix"]/p').first.text
    offer_map[:desc] = description

    doc.xpath('//p[@class="price"]').each do |p|

      if( p.search('span').empty? == false)        
        offer_map[:price] = p.search('span').first.text
      end
      #byebug      
    end

    return offer_map
  end
end