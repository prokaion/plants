class ShopParser::FetcherHollaender < ShopParser::DataFetcher

  def get_offer_urls(domain, url)
    urls = []

    begin
      doc = Nokogiri::HTML(open(url))

      pagination = doc.xpath('//div[@class="teasernav"]').first

      next_page_part = ""
      pagination.xpath('a').each do |link|

        if( link.text == "»")
          next_page_part = link['href']
        end
      end

      doc.xpath('//div[@class="teaserpicture"]/a').each do |offer_url|
        part = offer_url['href'].sub(/.\//, "")
        offer_url = url.sub(/index*.php/, part)
        urls << offer_url
      end
      
      #dirty quick and ugly
      url = url.sub(/index*.php/, next_page_part)
    end until next_page_part.empty?

    return urls
  end

  def fetch_data(url)
    puts url
  end
end