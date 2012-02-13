require 'store_state_set'

class ArrayOfStoreState
  attr_reader :store_state_sets
  def initialize(store_state_sets)
    @store_state_sets = store_state_sets
  end
  
  def self.parse(xml)
    # debugger
    # doc = Nokogiri::XML(xml) 
    sets = xml.css("ArrayOfStoreState > StoreState").map do |storestate| 
      StoreStateSet.from_xml(storestate) 
    end 
    new(sets)
  end

end
