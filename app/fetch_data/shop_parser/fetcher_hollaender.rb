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
        
        offer_url = url.sub(/index.*\.php/, part)
        urls << offer_url
      end
      
      #dirty quick and ugly      
      url = url.sub(/index.*\.php/, next_page_part)
    end until next_page_part.empty?
    
    return urls
  end

  def fetch_data(url)
    puts url
    offer_map = super(url)    
    doc = Nokogiri::HTML(open(url))

    offer_map[:offer_name] = doc.xpath('//h1').text  
    desc = doc.xpath('//div[@class="paragraph"]/p').text
    offer_map[:desc] = desc


    # price is sometimes hidden in javascript part of holländer page! strange!!
    price_string = doc.xpath('//p[@class="s2d" and @id="price"]').text

    if(price_string.match(/([0-9]+[.,][0-9]{2})/).nil?)
      script = doc.xpath('//script[@type="text/javascript"]').text
    
      # get price from javascript text:
      price_string = parsePriceFromJavaScriptPart(script)
    end

    offer_map[:price] = price_string

    puts offer_map

    return offer_map
  end


  def testParseFileWithRegex(filename)
    file = File.open(filename, :encoding => 'iso-8859-1')
    string = file.read
    puts string.class
    price_line = string.slice(/variation\[1\].price =.*$/)
    puts price_line

    priceString = price_line.slice(/[0-9]+([\.\,][0-9]{2})?;/).chop
    puts priceString
    file.close
  end

  private
    def parsePriceFromJavaScriptPart(input)
      price_line = input.slice(/variation\[1\].price =.*$/)
      priceString = price_line.slice(/[0-9]+([\.\,][0-9]{2})?;/).chop
      # if no cents are given, add them..
      if priceString.match(/[0-9]+/)
        priceString += ".00"
      end
    end
end