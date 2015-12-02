class OfferBuilder

  def build(offer_map, path_id)
    offer = Offer.find_by(name: offer_map[:offer_name])
    
    if offer.nil?
      offer = Offer.new
      offer.name = offer_map[:offer_name]
    end 

    offer.path_id = path_id
    offer.url = offer_map[:url]
    offer.desc = offer_map[:desc]
    priceString = offer_map[:price]

    price = convert_price(priceString)

    offer.price_cent = price 
    puts offer.price_cent
    # set offer active
    offer.active = true 
    return offer 
  end


  private
    def convert_price(price_string)
      array = price_string.split(/([0-9]+[.,][0-9]{2})/)
      resulting_price_string = ""
      array.each do |part|
        if( part.match(/([0-9]+[.,][0-9]{2})/))
          resulting_price_string = part
        end
      end

      price = 0
      if ( !resulting_price_string.empty? )
        #replace , with .
        resulting_price_string = resulting_price_string.sub(',','.')
        # convert to integer
        price = (resulting_price_string.to_f * 100).round.to_i
      end
      return price
    end
end