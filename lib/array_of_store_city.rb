require 'store_city_set'

class ArrayOfStoreCity
  attr_reader :store_city_sets
  def initialize(store_city_sets)
    @store_city_sets = store_city_sets
  end
  
  def self.parse(xml)
    # debugger
    # doc = Nokogiri::XML(xml) 
    sets = xml.css("ArrayOfStoreCity > StoreCity").map do |storecity| 
      StoreCitySet.from_xml(storecity) 
    end 
    new(sets)
  end

end
