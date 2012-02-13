require 'store_set'

class ArrayOfStore
  attr_reader :store_sets
  def initialize(store_sets)
    @store_sets = store_sets
  end
  
  def self.parse(xml)
    sets = xml.css("ArrayOfStore > Store").map do |store| 
      StoreSet.from_xml(store) 
    end 
    new(sets)
  end

end
