class OfferRunner
  require 'open-uri'

  def runner
    pathes = Path.all
    url = ""

    pathes.each do |path|
      # get url from shop
      url = path.shop.url      
      # get all subPathes from path
      sub_paths = SubPath.where("path_id = ?", path.id)

      sub_paths.each do |sub_path|
        url += sub_path.part
      end
      Rails.logger.info url

      # gather urls and fetch data
      offer_urls = get_offer_urls(path.shop.url, url) 

      builder = OfferBuilder.new
      offer_urls.each do |url|
        offer_map = fetch_data( path.shop.url + url)
        offer = builder.build(offer_map)

        offer.save
      end     
    end

  end

  def get_offer_urls(domain, url)
    urls = []

    begin
      doc = Nokogiri::HTML(open(url))

      pagination = doc.xpath('//ul[@class="pagination"]').first

      next_link = pagination.search('//a[@class="next"]').first

      doc.xpath('//div[@class="tsr-product cc"]').each do |div_offer| 
        urls.push(div_offer.search('a').first['href'])
      end
      
      # create link for next page
      if (next_link.nil? == false)
        url = domain + next_link['href']        
      end

    end until next_link.nil?

    return urls
  end

  def fetch_data(url)
    doc = Nokogiri::HTML(open(url))

    offer_map = { :offer_name => doc.xpath('//li[@class="last"]').text }
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