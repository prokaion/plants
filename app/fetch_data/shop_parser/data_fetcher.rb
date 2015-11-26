# kind of a Factory
class ShopParser::DataFetcher

  def self.new(typeName)
    if(typeName == 'dehner')
      object = ShopParser::DataFetcherDehner.allocate
    elsif(typeName == 'holländer')
      object = ShopParser::FetcherHollaender.allocate
    else
      raise NotImplementedError, typeName + " is not implemeted!"
    end

    object.send( :initialize)

    return object
  end
end